# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "getclicky"

Gem::Specification.new do |s|
  s.name        = "getclicky"
  s.version     = Getclicky::Version::STRING
  s.authors     = ["Peterson Ferreira"]
  s.email       = ["petersonferreiras@gmail.com"]
  s.homepage    = "http://github.com/petersonferreira/getclicky"
  s.summary     = %q{Ruby Wrapper for GetClicky API Analytics}
  s.description = s.summary

  s.add_dependency "httparty"                 , "~> 0.7.8"
  s.add_development_dependency "rspec"        , "~> 2.6"
  s.add_development_dependency "test_notifier", "~> 0.3"
  s.add_development_dependency "fakeweb"      , "~> 1.3"
  s.add_development_dependency "ruby-debug19" , "~> 0.11"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end