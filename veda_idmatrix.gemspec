# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'veda_idmatrix/version'

Gem::Specification.new do |spec|
  spec.name          = "veda_idmatrix"
  spec.version       = VedaIdmatrix::VERSION
  spec.authors       = ["Andre Mouton", "Jean le Roux"]
  spec.email         = ["info@easylodge.com.au", "info@shuntyard.com"]
  spec.summary       = %q{Veda IDMatrix Identity Verification.}
  spec.description   = %q{Rails gem for using Veda IDMatrix Identity Verification service.}
  spec.homepage      = "https://github.com/easylodge/veda_idmatrix"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency 'rails', '~> 7.0.0'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'shoulda-matchers', '~> 5.0'
  spec.add_dependency 'rexml', '~> 3.2', '>= 3.2.4'
  spec.add_development_dependency 'pry'

  spec.add_dependency "nokogiri"
  spec.add_dependency "httparty"
  spec.add_dependency 'activesupport'
end
