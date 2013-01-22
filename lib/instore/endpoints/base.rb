require 'httparty'

module Instore
  module EndPoints
    class BaseResponse
      def initialize(host, access_token, attributes_hash)
        @host = host
        @access_token = access_token

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

      def self.response_class(klass)
        @@response_class = klass
      end

      response_class BaseResponse

      def initialize(host, access_token, options = {})
        @host = host
        @access_token = access_token
        @options = options
        @prepend_path = @options[:prepend_path]
        @options[:query] ||= {} 
        @options[:query][:access_token] = access_token
      end

      def path
        if @prepend_path
          "#{@host}/v1/api/#{@prepend_path}/#{resource}"
        else
          "#{@host}/v1/api/#{resource}"
        end
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

      def first
        fetch.first
      end

      def fetch
        response = self.class.get(path, @options)
        build_response_collection(response["data"])
      end

      def to_a
        fetch
      end

      private

      def build_response(hash)
        @@response_class.new(@host, @access_token, hash)
      end

      def build_response_collection(array)
        array.map { |hash| build_response(hash) }
      end
    end
  end
end