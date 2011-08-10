require "spec_helper"

describe Getclicky do
  describe "configure" do
    it "sets site_id" do
      Getclicky.configure { |c| c.site_id = "123" }
      Getclicky.site_id.should == "123"
    end
    
    it "sets sitekey" do
      Getclicky.configure { |c| c.sitekey = "123" }
      Getclicky.sitekey.should == "123"
    end
  end
  
  describe "endpoint" do
    it "should returns the real url" do
      ENV.delete("GETCLICKY_ENDPOINT")
      Getclicky.endpoint.should == "http://api.getclicky.com/api/stats/4"
    end
    
    it "should changes the url" do
      ENV["GETCLICKY_ENDPOINT"] = "http://getclicky.com"
      Getclicky.endpoint.should == "http://getclicky.com"
    end
  end
end