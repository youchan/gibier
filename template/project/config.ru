require 'bundler/setup'
Bundler.require(:default)

require 'opal'
require 'opal-browser'
require 'rack'

dir = 'data'
Dir.mkdir dir + '/pages' unless Dir.exist? dir + '/pages'

Hyaslide::SlideLoader.new(dir).run

server = Opal::Server.new do |s|
  s.append_path dir + '/pages'
  s.append_path 'app'
  s.append_path 'images'
  s.append_path 'css'
  s.append_path 'fonts'

  Opal.use_gem 'opal-router'
  Opal.use_gem 'hyalite'
  Opal.use_gem 'hyaslide'

  s.debug = true
  s.main = 'application'
  s.index_path = 'index.html.haml'
end

Rack::Handler::WEBrick.run server
