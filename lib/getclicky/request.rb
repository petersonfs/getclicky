module Getclicky
  module Request  
    include HTTParty
    extend self
    
    def get(type, params = {})
      response = self.class.get(Getclicky.endpoint, :query => build_params(type, params))
      
      case response.code
      when "404"
        raise Getclicky::NotFoundError
      else
        Getclicky::Response.new(response)
      end
    end
    
    def build_params(type, params = {})
      query = { :site_id => Getclicky.site_id, :sitekey => Getclicky.sitekey, :type => type }
      query.merge(params)
    end
  end
end