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

  s.add_dependency "hashie"                   , "~> 2.0.5"
  s.add_development_dependency "rspec"        , "~> 2.13.0"
  s.add_development_dependency "test_notifier", "~> 1.0.0"
  s.add_development_dependency "fakeweb"      , "~> 1.3.0"
  s.add_development_dependency "pry"          , "~> 0.9.12.2"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
