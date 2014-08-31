require "spec_helper"

describe Getclicky do
  describe "configure" do
    it "should be set site_id" do
      Getclicky.configure { |c| c.site_id = "123" }
      expect(Getclicky.site_id).to eq("123")
    end

    it "should be set site_key" do
      Getclicky.configure { |c| c.sitekey = "123" }
      expect(Getclicky.sitekey).to eq("123")
    end

    it "should be set admin_sitekey" do
      Getclicky.configure { |c| c.admin_sitekey = "123" }
      expect(Getclicky.admin_sitekey).to eq("123")
    end
  end

  describe "endpoint" do
    it "should be returns the real url" do
      ENV.delete("GETCLICKY_ENDPOINT")
      expect(Getclicky.endpoint).to eq("http://api.clicky.com/api/stats/4")
    end

    it "should be changes the url" do
      ENV["GETCLICKY_ENDPOINT"] = "http://api.clicky.com/api/stats/4"
      expect(Getclicky.endpoint).to eq("http://api.clicky.com/api/stats/4")
    end
  end
end
