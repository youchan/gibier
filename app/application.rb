require 'hyalite'
require 'opal-router'
require 'browser/interval'
require 'page_base'

module App
  def self.render
    Hyalite.render(Hyalite.create_element(Hyaslide::Slide, nil), $document['.hyaslide'])
  end
end

module Hyaslide
  def self.page_count
    @page_count
  end

  def self.page_count=(count)
    @page_count = count
  end

  class Slide
    include Hyalite::Component
    include Hyalite::Component::ShortHand

    def pages(height)
      Hyaslide.page_count.times.map do |i|
        Object.const_get("Hyaslide::Page#{i}").el({visible: @state[:page_number] == i, page_number: i, slide_height: height})
      end
    end

    def initial_state
      { page_number: 0 }
    end

    def component_did_mount
      $window.on(:keydown) do |evt|
        handle_key_down(evt)
      end
    end

    def component_did_unmount

    end

    def handle_key_down(evt)
      case evt.code
      when 39
        set_state(page_number: @state[:page_number] + 1) if @state[:page_number] < Hyaslide.page_count
      when 37
        set_state(page_number: @state[:page_number] - 1) if @state[:page_number] > 0
      else
        puts "keycode = #{evt.code}"
      end
    end

    def render
      follow_height = $window.view.height / $window.view.width < 700 / 960
      if follow_height
        zoom = $window.view.height.to_f / 700 * 0.9
      else
        zoom = $window.view.width.to_f / 960 * 0.9
      end

      top = ($window.view.height / zoom - 700) / 2
      left = ($window.view.width / zoom - 960) / 2

      div({
        className: 'slide',
        style: {zoom: zoom, top: "#{top}px", left: "#{left}px"},
        onKeyDown: -> (evt) { puts "evt"; handle_key_down(evt) }
      },
        pages(700 * zoom))
    end
  end
end

require 'pages'

$document.ready do
  $window.on(:resize) do
    App.render
  end

  App.render
end
