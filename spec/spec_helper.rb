require "bundler"
Bundler.setup(:default, :development)
Bundler.require(:default, :development)

require "getclicky"
require "rspec"
require "test_notifier/runner/rspec"

FakeWeb.allow_net_connect = false

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|file| require file}

RSpec.configure do |config|
  config.include Helpers
    
  # config.before do
  #   ENV.delete("GETCLICKY_ENDPOINT")
  # end
end