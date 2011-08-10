module Getclicky
  class Response    
    attr_accessor :request
    
    def initializer(request)
      @request = request
    end
    
    def data
      @request.body
    end
  end
end