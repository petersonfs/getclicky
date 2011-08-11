require "spec_helper"

describe Getclicky::Request do
  it "should be set the right parameters" do
    params = subject.build_params(:pages, :limit => 10, :hourly => 1)
    params.should == { :site_id => Getclicky.site_id, :sitekey => Getclicky.sitekey, :type => :pages, :limit => 10, :hourly => 1}
  end
end