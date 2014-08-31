require "coveralls"
Coveralls.wear!

require "getclicky"
require "rspec"
require "fakeweb"

FakeWeb.allow_net_connect = false

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|file| require file}

RSpec.configure do |config|
  config.include Helpers

  config.before do
    ENV.delete("GETCLICKY_ENDPOINT")
  end

  Getclicky.configure do |config|
    config.site_id = nil
    config.sitekey = nil
    config.admin_sitekey = nil
  end
end
