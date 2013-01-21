require 'httparty'

module Instore
  module EndPoints
    class BaseResponse
      def initialize(access_token, attributes_hash)
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
      base_uri 'http://own-dev3.railwaymen.org:4006/v1/api'

      @@response_class = BaseResponse

      def initialize(access_token, options = {})
        @access_token = access_token
        @options = options
        @prepend_path = @options[:prepend_path]
        @options[:query] ||= {} 
        @options[:query][:access_token] = access_token
      end

      def path
        "#{@prepend_path}/#{resource}"
      end

      def create(params = {})
        build_response self.class.post(path, {body: params}.merge(@options))
      end

      def update(id, params = {})
        build_response self.class.put("#{path}/#{id}", {body: params}.merge(@options))
      end

      def destroy(id)
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
        @@response_class.new(@access_token, hash)
      end

      def build_response_collection(array)
        array.map { |hash| build_response(hash) }
      end
    end
  end
end