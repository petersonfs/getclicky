module Helpers
  def default_credentials!
    Getclicky.configure do |config|
      config.site_id = "32020"
      config.site_key = "2e05fe2778b6"
    end
  end
end