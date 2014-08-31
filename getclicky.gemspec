# -*- encoding: utf-8 -*-
require File.expand_path("../lib/getclicky/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "getclicky"
  s.version     = Getclicky::Version::STRING
  s.authors     = ["Peterson Ferreira"]
  s.email       = ["petersonferreiras@gmail.com"]
  s.homepage    = "http://github.com/petersonfs/getclicky"
  s.summary     = %q{Ruby Wrapper for Clicky Analytics API}
  s.description = s.summary

  s.add_dependency "hashie"              , "~> 3.3.1"
  s.add_development_dependency "rspec"   , "~> 3.0.0"
  s.add_development_dependency "fakeweb" , "~> 1.3.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
