lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hyaslide/version'

Gem::Specification.new do |spec|
  spec.name          = "hyaslide"
  spec.version       = Hyaslide::VERSION
  spec.authors       = ["youchan"]
  spec.email         = ["youchan01@gmail.com"]

  spec.summary       = %q{Making slide from markdown file}
  spec.description   = %q{This is presentation app making slide from markdown file.}
  spec.homepage      = "https://github.com/youchan/hyalide"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*.rb'] + Dir['bin/*'] + Dir['template/**/*']
  spec.bindir        = "bin"
  spec.executables   = "hyaslide"
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'sinatra'
  spec.add_runtime_dependency 'sinatra-contrib'
  spec.add_runtime_dependency 'thin'
  spec.add_runtime_dependency 'haml'
  spec.add_runtime_dependency 'sass'
  spec.add_runtime_dependency 'thor'

  spec.add_runtime_dependency 'redcarpet'
  spec.add_runtime_dependency 'unindent'
  spec.add_runtime_dependency 'rouge', "~> 1.10"
  spec.add_runtime_dependency 'fssm'
  spec.add_runtime_dependency 'eventmachine'

  spec.add_runtime_dependency 'rack', "~> 1.6"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
