require "spec_helper"

describe Getclicky::Request do
  
  subject {
    Getclicky::Request.new(:pages, :limit => 10, :hourly => 1)
  }
  
  its(:type) { should eql (:pages) }
  its(:params) { should eql ({:limit => 10, :hourly => 1})}
  
  context "method build_params" do
    it "should be set the right parameters" do
      params = subject.build_params(:pages, :limit => 10, :hourly => 1)
      params.should == { :site_id => Getclicky.site_id, :sitekey => Getclicky.sitekey, :type => :pages, :limit => 10, :hourly => 1, :output => :json}
    end
  
    it "should be leave hash parameters blank" do
      params = subject.build_params(:pages)
      params.should == { :site_id => Getclicky.site_id, :sitekey => Getclicky.sitekey, :type => :pages, :output => :json}
    end
    
    it "should default to an output format of json" do
      params = subject.build_params(:pages)
      params.should == { :site_id => Getclicky.site_id, :sitekey => Getclicky.sitekey, :type => :pages, :output => :json}
    end
    
    it "should allow overriding the output format" do
      params = subject.build_params(:pages, :output => :xml)
      params.should == { :site_id => Getclicky.site_id, :sitekey => Getclicky.sitekey, :type => :pages, :output => :xml}
    end
  end
end