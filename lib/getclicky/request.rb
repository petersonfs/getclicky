module Getclicky
  class Request  
    include HTTParty
      
    attr_accessor :type, :params
              
    def initialize(type, params = {})
      @type = type
      @params = params
    end
    
    # Handle all HTTP::Get request, wrapping all the logic
    #
    def get
      response = self.class.get(Getclicky.endpoint, :query => build_params(@type, @params))

      case response.code
      when "404"
        raise Getclicky::NotFoundError
      else
        Getclicky::Response.new(response)
      end
    end

    # Build the hash of options for make resquest to API
    #
    def build_params(type, params = {})
      query = { :site_id => Getclicky.site_id, :sitekey => Getclicky.sitekey, :type => type, :output => :json }
      query.merge(params) if params
    end
  end
end