require 'httparty'

module Instore
  module EndPoints
    class CollectionResponse
      include Enumerable

      def initialize(array, options = {})
        @array = array
        @previous_page = options[:previous_page]
        @next_page = options[:next_page]
      end

      def previous_page?
        !!@previous_page
      end

      def next_page?
        !!@next_page
      end

      def each
        @array.each { |e| yield e }
      end
    end

    class SingleResponse
      def initialize(attributes_hash)
        attributes_hash.each do |name, value| 
          instance_variable_set("@#{name}", value)
          unless respond_to? name
            self.class.instance_eval do
              attr_reader name
            end
          end
        end
      end
    end

    class Base
      include ::HTTParty
      format :json

      def initialize(host, access_token, params = {})
        @host = host
        @access_token = access_token
        @options = {}
        @options[:query] = {}
        @options[:query].merge!(params)
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
        build_response self.class.get("#{path}/#{id}", @options)
      end

      def fetch
        response = self.class.get(path, @options)
        build_response_collection(response["data"],
          previous_page: response["paging"]["previous"], 
          next_page: response["paging"]["next"])
      end

      def to_a
        fetch
      end

      private

      def build_response(hash)
        SingleResponse.new(hash)
      end

      def build_response_collection(array, options)
        CollectionResponse.new(array, options)
      end
    end
  end
end