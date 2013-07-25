require "net/http"
require "uri"

module Getclicky
  class Request    
    attr_accessor :type, :params
              
    def initialize(type, params = {})
      @type = type
      @params = params
    end
    
    # Handle all HTTP::Get request, wrapping all the logic
    #
    def get      
      response = Net::HTTP.get_response(build_url())

      case response.code
        when Net::HTTPNotFound
          raise Getclicky::NotFoundError
        else
          Getclicky::Response.new(response.body, @params[:output])
      end
    end
    
    #Build the url for make request to API
    #
    def build_url
      uri = URI.parse(Getclicky.endpoint)
      uri.query = Getclicky::Encode.encode(build_params(@type, @params))
      uri
    end

    # Build the hash of options for make resquest to API
    #
    def build_params(type, params = {})
      query = { :site_id => Getclicky.site_id, :sitekey => Getclicky.sitekey, :type => type.to_s.gsub(/_/, '-'), :output => :json }
      query.merge(params) if params
    end
  end
end