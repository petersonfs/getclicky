module Getclicky
  class Response    
    attr_accessor :item
    
    def initialize(item)
      @item = item
    end
      
    def data
      @item.body
    end
  end
end