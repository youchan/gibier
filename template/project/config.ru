require 'bundler/setup'
Bundler.require(:default)

# require 'hyaslide'
require_relative 'server'

dir = 'data'
Dir.mkdir dir + '/pages' unless Dir.exist? dir + '/pages'
Hyaslide::SlideLoader.new(dir).run

app = Rack::Builder.app do
  server = Server.new(host: 'localhost')

  map '/' do
    run server
  end

  map '/assets' do
    run server.settings.opal.sprockets
  end

  map '/__OPAL_SOURCE_MAPS__' do
    run Opal::SourceMapServer.new(server.settings.opal.sprockets, '/__OPAL_SOURCE_MAPS__')
  end
end

Rack::Server.start({
  app:    app,
  server: 'thin',
  Host:   '0.0.0.0',
  Port:   8080,
  signals: false,
})
