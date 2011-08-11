# Getclicky API Analytics Ruby Client Library
#
# Allows access to the getclicky.com Analytics API using the ruby programming language.
#
# Copyright (c) 2011+ Peterson Ferreira
# See LICENSE for details
#
module Getclicky
  module Request  
    include HTTParty
    extend self
    
    # Handle all HTTP::Get request, wrapping all the logic
    # like endpoint and more.
    #
    def get(type, params = {})
      response = self.class.get(Getclicky.endpoint, :query => build_params(type, params))
      
      case response.code
      when "404"
        raise Getclicky::NotFoundError
      else
        Getclicky::Response.new(response)
      end
    end
    
    # Build the hash of options for given a resquest to API
    #
    def build_params(type, params = {})
      query = { :site_id => Getclicky.site_id, :sitekey => Getclicky.sitekey, :type => type }
      query.merge(params)
    end
  end
end