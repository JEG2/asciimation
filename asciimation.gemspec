# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'asciimation/version'

Gem::Specification.new do |spec|
  spec.name          = "asciimation"
  spec.version       = Asciimation::VERSION
  spec.authors       = ["James Edward Gray II"]
  spec.email         = ["james@graysoftinc.com"]

  spec.summary       = %q{This is the tool used in Codalyzed videos.}
  spec.description   = %q{A simple application for animating the display of ASCII art images in your terminal.  This is the tool used in Codalyzed videos.}
  spec.homepage      = "https://github.com/JEG2/asciimation"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake",    "~> 10.0"

  spec.add_dependency "rurses", "~> 0.1.0"
end
