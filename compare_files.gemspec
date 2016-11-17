# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'compare_files/version'

Gem::Specification.new do |spec|
  spec.name          = "compare_files"
  spec.version       = CompareFiles::VERSION
  spec.authors       = ["Nick Zubariev"]
  spec.email         = ["nick.zubariev@gmail.com"]

  spec.summary       = "The gem for comparing content of two files."
  spec.description   = "Compares content of two files."
  spec.homepage      = "https://github.com/nzubariev/files_comparing"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = "~> 2.3.0"

  spec.add_runtime_dependency "bundler", "~> 1.11"
  spec.add_runtime_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "activesupport", "~> 5.0"
end
