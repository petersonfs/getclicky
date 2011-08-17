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
  end
end