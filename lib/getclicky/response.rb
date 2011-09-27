require "hashie"

module Getclicky
  class Response
    attr_accessor :item
    
    class << self
      attr_accessor :mash_class
    end
    
    self.mash_class = ::Hashie::Mash
    
    def initialize(item)
      @item = item
    end
      
    def data
      if @item.size.eql?(1)
        parse(@item.first['dates'])
      elsif @item.size > 1
        {}.tap do |results|
          @item.collect { |r| results[r['type'].intern] = parse(r['dates']) }
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