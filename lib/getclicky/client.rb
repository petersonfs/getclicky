module Getclicky
  class Client    
    Getclicky::Types::ALL.each do |type|
      class_eval <<-RUBY, __FILE__, __LINE__  
        def #{type.to_s.downcase}(params = {})                                            # def pages(params = {})
          response = Getclicky::Request.get(:#{type.to_s.gsub(/[_]/, '-')}, params = {})  #   response = Getclicky::Request.get(:pages, params = {})
          response.data                                                                   #   response.data
        end                                                                               # end
      RUBY
    end    
  end
end