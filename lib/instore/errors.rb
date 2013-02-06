module Instore
  class UnsupportedMethod < NoMethodError
    def initialize(method, object)
      @method = method
      @object = object
    end

    def message
      methods = @object.public_methods - Object.methods
      "undefined method '#{@method}' for #{@object}
Available methods : #{methods.join(", ")} "
    end
  end
end