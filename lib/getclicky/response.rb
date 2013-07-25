require "hashie"
require "json"

module Getclicky
  class Response
    attr_accessor :item, :format
    
    class << self
      attr_accessor :mash_class
    end
    
    self.mash_class = ::Hashie::Mash
    
    def initialize(item, format = nil)
      @item = item
      @format = format
    end
      
    def data
      @format.nil? ? mashify_data : @item
    end
    
    def mashify_data
      json = @item.is_a?(String) ? JSON.parse(@item) : @item
      if json.size.eql?(1)
        parse(json.first['dates'])
      elsif json.size > 1
        {}.tap do |results|
          json.collect { |r| results[r['type'].gsub('-','_').intern] = parse(r['dates']) }
        end
      else
        @item
      end
    end
    
    def parse(body)
      case body
      when Hash
        self.class.mash_class.new(body)
      when Array
        body.map { |item| item.is_a?(Hash) ? self.class.mash_class.new(item) : item }
      else
        body
      end
    end
  end
end