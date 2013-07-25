module Getclicky
  class Client
    # Dynamically defines the methods to be called.
    # This is a interface of library.
    #
    Getclicky::Types::ALL.each do |type|
      class_eval <<-RUBY, __FILE__, __LINE__
        def #{type.to_s.downcase}(params = {})                      # def pages(params = {})
          response = Getclicky::Request.new(:#{type}, params).get   #   response = Getclicky::Request.new(:pages, params).get
          response.data                                             #   response.data
        end                                                         # end
      RUBY
    end
    
    # Retrieves a request with lot of parameters
    # See documentation for more info
    #
    def multiple(types = [], params = {})
      valid_types = types.reject { |t| !Getclicky::Types::ALL.include?(t.intern) }
      response = Getclicky::Request.new(valid_types.join(','), params).get
      response.data
    end
  end
end