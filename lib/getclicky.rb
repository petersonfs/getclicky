# A Ruby class to call the Getclicky API Analytics.
# You might use this if you want to see data of Getclicky in your application.

require "httparty"

module Getclicky
  autoload :Client  , "getclicky/client"
  autoload :Request , "getclicky/request"
  autoload :Response, "getclicky/response"
  autoload :Types   , "getclicky/types"
  autoload :Version , "getclicky/version"
  
  # Class implemented to abstract 404 errors.
  #
  class Getclicky::NotFoundError < StandardError; end
  
  class << self
    # Set the site_id that will do requests to the API.
    # Will be required in every request.
    #
    attr_accessor :site_id
    
    # Set the sitekey that will do request to the API.
    # Will be required in every request.
    #
    attr_accessor :sitekey
    
    # Set the admin sitekey.
    # Only used for certain requests.
    #
    attr_accessor :admin_sitekey
  end
  
  # API endpoint of Getclicky
  #
  def self.endpoint
    ENV.fetch("GETCLICKY_ENDPOINT", "http://api.getclicky.com/api/stats/4")
  end
  
  # Yield Getclicky module so you can easily configure options
  #
  def self.configure(&block)
    yield Getclicky
  end
end