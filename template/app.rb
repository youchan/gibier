require 'slide'
require 'page_base'
require 'slides/#{name}/pages'
require 'browser/socket'
require 'browser/location'

Hyaslide.slide_name = '#{name}'

module App
  def self.render(ws)
    Hyalite.render(Hyalite.create_element(Hyaslide::Slide, {ws:ws}), $document['.hyaslide'])
  end
end

$document.ready do
  ws = Browser::Socket.new("ws://\#{$window.location.host}/push_notification/start/slide/#{name}")

  $window.on(:resize) do
    App.render(ws)
  end

  App.render(ws)
end
