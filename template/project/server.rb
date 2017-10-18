require 'sinatra'
require 'sinatra-websocket'
require 'opal'
require 'opal/sprockets'

class Server < Sinatra::Base
  def initialize(slide_loader, *args, &block)
    @slide_loader = slide_loader
    super(*args, &block)
  end

  def sprockets
    settings.opal.sprockets
  end

  configure do
    opal = Opal::Server.new do |server|
      server.append_path 'data'
      server.append_path 'app'
      server.append_path 'assets'

      Opal.use_gem 'opal-router'
      Opal.use_gem 'opal-websocket'
      Opal.use_gem 'hyalite'
      Opal.use_gem 'gibier'

      Opal.paths.each {|path| server.append_path path }

      server.main = 'application'
    end

    set :opal, opal
    set :sockets, []
    set :slide_sockets, {}
    enable :sessions
  end

  get '/' do
    @slides = @slide_loader.slides
    haml :index
  end

  get "/favicon.ico" do
  end

  get '/:slide_name' do
    @slide_name = params['slide_name']
    haml :slide
  end

  get '/script/:slide_name' do
    @slide_name = params['slide_name']
    @script_html = "<h1>Test</h1>"
    haml :script
  end

  get '/push_notification/start/:page/:slide_name' do
    request.websocket do |ws|
      ws.onopen do
        if params['page'] == 'slide'
          slide_name = params['slide_name']
          (settings.slide_sockets[slide_name] ||= []) << ws
        end
        settings.sockets << ws
      end
      ws.onmessage do |msg|
        (slide_name, evt, value) = msg.split(':')
        EM.next_tick do
          settings.slide_sockets[slide_name].each{|s| s.send("#{evt}:#{value}") }
        end
      end
      ws.onclose do
        settings.sockets.delete(ws)
      end
    end
  end
end
