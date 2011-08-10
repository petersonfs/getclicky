module Helpers
  
  def default_credentials!
    Getclicky.configure do |config|
      config.username = "john"
      config.api_key = "abc"
    end
  end

end