lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gibier/version'

Gem::Specification.new do |spec|
  spec.name          = "gibier"
  spec.version       = Gibier::VERSION
  spec.authors       = ["youchan"]
  spec.email         = ["youchan01@gmail.com"]

  spec.summary       = %q{A slide tool inspired by Rabbit}
  spec.description   = %q{ This is a simple slideshow app using Hyalite(https://github.com/youchan/hyalite).
Its purpose are one of examples for Hyalite and also intend to be used as pratical presentation tool.}
  spec.homepage      = "https://github.com/youchan/gibier"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*.rb'] + Dir['bin/*'] + Dir['template/**/*']
  spec.bindir        = "bin"
  spec.executables   = "gibier"
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'sinatra'
  spec.add_runtime_dependency 'sinatra-contrib'
  spec.add_runtime_dependency 'sinatra-websocket'
  spec.add_runtime_dependency 'thin'
  spec.add_runtime_dependency 'haml'
  spec.add_runtime_dependency 'sass'
  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'opal'

  spec.add_runtime_dependency 'redcarpet'
  spec.add_runtime_dependency 'unindent'
  spec.add_runtime_dependency 'rouge', "~> 1.10"
  spec.add_runtime_dependency 'listen', "~> 3.1"
  spec.add_runtime_dependency 'eventmachine'

  spec.add_runtime_dependency 'rack', "~> 1.6"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
