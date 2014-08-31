require "spec_helper"

describe Getclicky::Client do
  context "should be create methods to make request to API" do
    Getclicky::Types::ALL.each do |type|
      class_eval <<-RUBY, __FILE__, __LINE__
        it "should be implement #{type.to_s} method" do
          expect(subject).to respond_to(type)
        end
      RUBY
    end

    it "should be implement multiple method" do
      expect(subject).to respond_to("multiple")
    end
  end
end
