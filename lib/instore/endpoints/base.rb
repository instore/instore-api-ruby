require 'hashie'
require 'httparty'

module Instore
  module EndPoints
    class Base
      include ::HTTParty
      format :json

      def initialize(host, access_token)
        @host = host
        @access_token = access_token
        @options = {}
        @options[:query] = {}
        @options[:query][:access_token] = access_token
      end

      def path
        "#{@host}/v1/api/#{resource}"
      end

      def create_resource(params = {})
        build_response self.class.post(path, {body: params}.merge(@options))
      end

      def update_resource(id, params = {})
        build_response self.class.put("#{path}/#{id}", {body: params}.merge(@options))
      end

      def destroy_resource(id)
        build_response self.class.delete("#{path}/#{id}", @options)
      end

      def find(id)
        response = self.class.get("#{path}/#{id}", @options)
        build_response(response)
      end

      def fetch(params = {})
        options = @options
        options[:query].merge!(params)

        response = self.class.get(path, options)

        if response["paging"] && response["paging"]["previous"]
          previous_page = !!response["paging"]["previous"]
        else
          previous_page = false
        end

        if response["paging"] && response["paging"]["next"]
          next_page = !!response["paging"]["next"]
        else
          next_page = false
        end

        response["data"] ||= []

        build_response_collection(response, 
          previous_page?: previous_page,
          next_page?: next_page)
      end

      def to_a
        fetch
      end

      private

      def build_response(hash)
        Hashie::Mash.new(hash)
      end

      def build_response_collection(hash, options)
        Hashie::Mash.new(hash.merge(options))
      end
    end
  end
end