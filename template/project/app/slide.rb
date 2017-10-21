require 'hyalite'
require 'opal-router'
require 'track_field'

module Gibier
  SLIDE_WIDTH = 960
  SLIDE_HEIGHT = 720

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

  def self.gh_pages
    `window.ghPages`
  end

  def self.gh_pages=(page)
    `window.ghPages=page`
  end

  def self.assets_path
    `window.assetsPath`
  end

  def self.assets_path=(path)
    @assets_path = path
  end

  class Slide
    include Hyalite::Component

    def pages(height)
      case @state[:mode]
      when :slide
        Gibier.page_count.times.map do |i|
          Object.const_get("Gibier::Page#{i}").el({visible: @state[:page_number] == i, page_number: i, slide_height: height})
        end
      when :print
        Gibier.page_count.times.map do |i|
          Object.const_get("Gibier::Page#{i}").el({visible: true, page_number: i, slide_height: height/Gibier.page_count})
        end
      end
    end

    def initial_state
      uri = $window.location.toString
      page_num = uri.sub(/.*#([0-9]+)/, '\1').to_i

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

      unless Gibier.gh_pages
        @props[:ws].onmessage do |msg|
          (event, value) = msg.data.split(':')
          case event
          when 'keydown'
            handle_key_down(value.to_i)
          end
        end
      end

      router = Router.new
      router.route('/') { page_to(num) }
      router.route(':page') {|params| set_state(page_number: params[:page].to_i) }
    end

    def page_to(num)
      $window.location.assign("#{$window.location.toString.sub(/#\d+$/, '')}##{num}")
    end

    def page_back
      page_to(@state[:page_number] - 1) if @state[:page_number] > 0
    end

    def page_forward
      page_to(@state[:page_number] + 1) if @state[:page_number] < Gibier.page_count
    end

    def handle_key_down(event)
      keycode = event.code
      case keycode
      when :Space, :ArrowRight, :ArrowUp
        page_forward
      when :Backspace, :ArrowLeft, :ArrowDown
        page_back
      when :KeyS, :KeyB
        unless @state[:start]
          set_state(start: Time.now)
        else
          set_state(start: nil)
        end
      when :KeyP
        if @state[:mode] == :slide
          set_state(mode: :print)
        else
          set_state(mode: :slide)
        end
      when :KeyF
        set_state(footer_visible: !@state[:footer_visible])
        if event.ctrl_key
          fullscreen
        end
      when :F5
        if event.shift_key
          fullscreen
        end
      else
        puts "keycode = #{keycode}"
      end
    end

    def fullscreen
      %x(
        var element = document.getElementsByClassName('gibier')[0];
        var requestMethod = element.requestFullScreen || element.webkitRequestFullScreen || element.mozRequestFullScreen || element.msRequestFullScreen;

        if (requestMethod) {
            requestMethod.call(element);
        }
      )
    end

    def duration
      text = "10"
      %x(
        var el = document.getElementsByClassName('duration')[0];
        if (el) {
          text = el.innerText;
        }
      )

      text.to_i * 60
    end

    def render
      follow_height = $window.height / $window.width < SLIDE_HEIGHT / SLIDE_WIDTH
      if follow_height
        zoom = $window.height.to_f / SLIDE_HEIGHT * 0.98
      else
        zoom = $window.width.to_f / SLIDE_WIDTH * 0.98
      end

      top = ($window.height / zoom - SLIDE_HEIGHT) / 2
      left = ($window.width / zoom - SLIDE_WIDTH) / 2

      footer_style = @state[:page_number] == 1 || !@state[:footer_visible] ? {style: {display: 'none'}} : {}

      case @state[:mode]
      when :slide
        div({className: 'background'},
          div({className: 'background-filter'},
            div({class: 'slide-controll'},
              div({class: 'page-back', onClick: -> { page_back }, onTouchStart: -> { page_back }}),
              div({class: 'page-forward', onClick: -> { page_forward }, onTouchStart: -> { page_forward }}),
              div({
                className: 'slide',
                style: {zoom: zoom, top: "#{top}px", left: "#{left}px"},
                onKeyDown: -> (event) { handle_key_down(event) }
              },
                pages(SLIDE_HEIGHT * zoom)
              ),
              Gibier::TrackField.el({total_time: duration, start: @state[:start], page_number: @state[:page_number], page_count: Gibier.page_count}),
              section({className: 'footer'}.merge(footer_style),
                p({className: 'title'}, Gibier.title),
                p({className: 'powered-by'}, "Powered by ", span({className: "hyalite"}, "Hyalite"))
              )
            )
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

