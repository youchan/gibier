require 'hyalite'
require 'opal-router'
require 'browser/interval'
require 'browser/location'
require 'track_field'

module Hyaslide
  SLIDE_WIDTH = 960
  SLIDE_HEIGHT = 720
  TOTAL_TIME = 35 * 60

  def self.page_count
    @page_count
  end

  def self.page_count=(count)
    @page_count = count
  end

  def self.title
    @title
  end

  def self.title=(title)
    @title = title
  end

  def self.slide_name
    @slide_name
  end

  def self.slide_name=(name)
    @slide_name = name
  end

  class Slide
    include Hyalite::Component
    include Hyalite::Component::ShortHand

    def pages(height)
      case @state[:mode]
      when :slide
        Hyaslide.page_count.times.map do |i|
          Object.const_get("Hyaslide::Page#{i}").el({visible: @state[:page_number] == i, page_number: i, slide_height: height})
        end
      when :print
        Hyaslide.page_count.times.map do |i|
          Object.const_get("Hyaslide::Page#{i}").el({visible: true, page_number: i, slide_height: height})
        end
      end
    end

    def initial_state
      page_num = $window.location.uri.sub(/.*\/#\/([0-9]+)/, '\1').to_i

      {
        page_number: page_num,
        mode: :slide,
        start: nil,
        footer_visible: false
       }
    end

    def component_did_mount
      $window.on(:keydown) do |evt|
        handle_key_down(evt)
      end

      router = Router.new
      router.route('/') { page_to(num) }
      router.route(':page') {|params| set_state(page_number: params[:page].to_i) }
    end

    def page_to(num)
      $window.location.assign("/#{Hyaslide.slide_name}##{num}")
    end

    def handle_key_down(evt)
      case evt.code
      when 39
        page_to(@state[:page_number] + 1) if @state[:page_number] < Hyaslide.page_count
      when 37
        page_to(@state[:page_number] - 1) if @state[:page_number] > 0
      when 83
        unless @state[:start]
          set_state(start: Time.now)
        else
          set_state(start: nil)
        end
      when 80
        if @state[:mode] == :slide
          set_state(mode: :print)
        else
          set_state(mode: :slide)
        end
      when 70
        set_state(footer_visible: !@state[:footer_visible])
      else
        puts "keycode = #{evt.code}"
      end
    end

    def render
      follow_height = $window.view.height / $window.view.width < SLIDE_HEIGHT / SLIDE_WIDTH
      if follow_height
        zoom = $window.view.height.to_f / SLIDE_HEIGHT * 0.98
      else
        zoom = $window.view.width.to_f / SLIDE_WIDTH * 0.98
      end

      top = ($window.view.height / zoom - SLIDE_HEIGHT) / 2
      left = ($window.view.width / zoom - SLIDE_WIDTH) / 2

      footer_style = @state[:page_number] == 1 || !@state[:footer_visible] ? {style: {display: 'none'}} : {}

      case @state[:mode]
      when :slide
        div({className: 'background'},
          div({
            className: 'slide',
            style: {zoom: zoom, top: "#{top}px", left: "#{left}px"},
            onKeyDown: -> (evt) { handle_key_down(evt) }
          },
            pages(SLIDE_HEIGHT * zoom)
          ),
          Hyaslide::TrackField.el({total_time: TOTAL_TIME, start: @state[:start], page_number: @state[:page_number], page_count: Hyaslide.page_count}),
          section({className: 'footer'}.merge(footer_style),
            p({className: 'title'}, Hyaslide.title),
            p({className: 'powered-by'}, "Powered by ", span({className: "hyalite"}, "Hyalite"))
          )
        )
      when :print
        div({
            className: 'print',
            onKeyDown: -> (evt) { handle_key_down(evt) } },
          pages(SLIDE_HEIGHT * zoom).map do |page|
            top += SLIDE_HEIGHT * zoom
            div({
              className: 'wrap-page',
              style: {zoom: zoom, top: "#{top}px", left: "#{left}px"},
            }, page)
          end
        )
      end
    end
  end
end

