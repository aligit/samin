# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'samin/version'

Gem::Specification.new do |spec|
  spec.name          = "samin"
  spec.version       = Samin::VERSION
  spec.authors       = ["alifakheri"]
  spec.email         = ["fakheri.ali@gmail.com"]

  spec.summary       = "Handy currency converter"
  spec.description   = "Given a reference currency and rates, get exchange rates"
  spec.homepage      = "https://github.com/aligit/samin"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4.0"
  spec.add_development_dependency "pry", "~> 0.10.3"
  spec.add_development_dependency "pry-byebug", "~> 3.3.0"
  spec.add_development_dependency "pry-coolline", "~> 0.2.5"
end
