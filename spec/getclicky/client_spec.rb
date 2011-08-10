require "spec_helper"

describe Getclicky::Client do
  context "methods for request type" do
    it "should implements pages" do
      subject.should respond_to(:pages)
    end
    
    it "should implements pages_entrance" do
      subject.should respond_to(:pages_entrance)
    end
    
    it "should implements pages_exit" do
      subject.should respond_to(:pages_exit)
    end
    
    it "should implements downloads" do
      subject.should respond_to(:downloads)
    end
  end
end