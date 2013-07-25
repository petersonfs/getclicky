require "spec_helper"

describe Getclicky::Encode do
  
  it "should properly encode nested query attributes" do
    hash = { custom: { email: "test@test.com" }, date: "last-7-days", output: :json }
    params = Getclicky::Encode.encode(hash)
    params.should == "custom[email]=test%40test.com&date=last-7-days&output=json"
  end
  
end
