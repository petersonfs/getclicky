require "httparty"
require "active_support/core_ext/object/to_param"
require "active_support/core_ext/object/to_query"
require "active_support/inflector"
require "active_support/core_ext/string/strip"
require "active_support/core_ext/object/blank"

# A Ruby class to call the Getclicky API Analytics.
# You might use this if you want to see data of Getclicky in your application.
#
module Getclicky
  autoload :Client  , "getclicky/client"
  autoload :Request , "getclicky/request"
  autoload :Response, "getclicky/response"
  autoload :Types   , "getclicky/types"
  autoload :Version , "getclicky/version"
  
  class Getclicky::UnauthorizedError < StandardError; end
  class Getclicky::NotFoundError < StandardError; end
  class Getclicky::AbstractMethodError < StandardError; end
  
  class << self
    # Set the site_id that will do requests to the API.
    # Will be required in every request.
    #
    attr_accessor :site_id
    
    # Set the sitekey that will do request to the API.
    # Will be required in every request.
    #
    attr_accessor :sitekey
  end
  
  # Return the API endpoint of Getclicky
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