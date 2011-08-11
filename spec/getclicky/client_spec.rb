require "spec_helper"

describe Getclicky::Client do
  context "methods for request type" do
    Getclicky::Types::ALL.each do |type|
      class_eval <<-RUBY, __FILE__, __LINE__  
        it "should be implement #{type.to_s} method" do
          subject.should respond_to(type)
        end
      RUBY
    end
  end
end