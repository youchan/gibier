require 'bundler/setup'
Bundler.require(:default)

require_relative 'server'

dir = 'data'

slide_loader = Hyaslide::SlideLoader.new
Dir.foreach(dir) do |dir_name|
  if !dir_name.start_with?('.') && File.directory?("#{dir}/#{dir_name}")
    slide_loader.add_slide(dir_name)
  end
end

app = Rack::Builder.app do
  server = Server.new(slide_loader, host: 'localhost')

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
