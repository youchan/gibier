require_relative './page_background'

module Gibier
  class PageBase
    include Hyalite::Component

    def initialize
      @height = 0
    end

    # def component_did_mount
    #   every(0.05) do
    #     if @props[:visible]
    #       prev_height = @height
    #       el = $document.css(".#{page_class_name}")[0]
    #       if el
    #         height = el.height.to_i
    #         unless (height - prev_height).abs < 3
    #           @height = height
    #           set_state(top: "#{((700 - @height)/2).to_i}px")
    #         end
    #       end
    #     end
    #   end
    # end

    def page_class_name
      "page_#{@props[:page_number]}"
    end

    def header
      nil
    end

    def content
      nil
    end

    def render
      rect = @props[:rect]
      container_style = {zoom: rect.zoom, top: "#{rect.top}px", left: "#{rect.left}px", width: "#{rect.width}px", height: "#{rect.height}px"}
      display = @props[:visible] ? 'block' : 'none'
      section({class: "page #{page_class_name}", style: {width: "#{$window.width}px", height: "#{$window.height}px", display: display}},
        div({class: 'page-container', style: container_style},
          div({class: 'page-header'}, header),
          div({class: 'page-content'}, content)
        ),
        PageBackground.el({zoom: rect.zoom, page_number: @props[:page_number]})
      )
    end
  end
end
