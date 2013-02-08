require 'httparty'

module Instore
  module EndPoints
    class Mash
      def initialize(attributes_hash)
        attributes_hash.each do |name, value|
          value = Mash.new(value) if value.is_a? Hash 
          value = value.map { |hash| Mash.new(hash) } if value.is_a? Array 

          instance_variable_set("@#{name}", value)
          unless respond_to? name
            self.class.instance_eval do
              attr_reader name
            end
          end
        end
      end

      def method_missing(method, *args, &block)
        raise Instore::UnsupportedMethod.new(method, self)
      end

      def [](val)
        public_send(val)
      end
    end

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

      def find(id)
        build_response(self.class.get("#{path}/#{id}", @options))
      end

      def fetch(params = {})
        options = @options
        options[:query].merge!(params)

        build_response(self.class.get(path, options))
      end

      def to_a
        fetch
      end

      private

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

      def method_missing(method, *args, &block)
        raise Instore::UnsupportedMethod.new(method, self)
      end

      def build_response(hash)
        Mash.new(hash)
      end
    end
  end
end