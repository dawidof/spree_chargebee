# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spree_chargebee/version'

Gem::Specification.new do |spec|
  spec.name          = "spree_chargebee"
  spec.version       = SpreeChargebee::VERSION
  spec.authors       = ["Spark Solutions"]
  spec.email         = ["we@sparksolutions.co"]

  spec.summary       = %q{Spree ChargeBee}
  spec.description   = %q{ChargeBee extension for Spree}
  spec.homepage      = "http://sparksolutions.co"
  spec.license       = "BSD-3"

  spec.required_ruby_version = '>= 2.0.0'

  #spec.files         = `git ls-files -z`.split("\x0").reject do |f|
  #  f.match(%r{^(test|spec|features)/})
  #end

  spec.require_paths = ["lib"]

  spec.add_dependency 'spree_core'#, '~> 2.4.0'
  spec.add_dependency 'chargebee'
  
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
