# Getclicky API Analytics Ruby Client Library
#
# Allows access to the getclicky.com Analytics API using the ruby programming language.
#
# Copyright (c) 2011+ Peterson Ferreira
# See LICENSE for details
#
module Getclicky
  class Response    
    attr_accessor :request
    
    def initializer(request)
      @request = request
    end
    
    def data
      @request.body
    end
  end
end