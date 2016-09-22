require 'sinatra'
require 'opal'
require 'opal/sprockets'

class Server < Sinatra::Base

  def sprockets
    settings.opal.sprockets
  end

  configure do
    opal = Opal::Server.new do |server|
      server.append_path 'data'
      server.append_path 'app'
      server.append_path 'assets'

      Opal.use_gem 'opal-router'
      Opal.use_gem 'hyalite'
      Opal.use_gem 'hyaslide'

      Opal.paths.each {|path| server.append_path path }

      server.main = 'application'
    end

    set :opal, opal
    enable :sessions
  end

  get '/:slide_name' do
    @slide_name = params['slide_name']
    haml :index
  end

  get "/favicon.ico" do
  end
end


