module Gibier
  class PageBase
    include Hyalite::Component
    include Hyalite::Component::ShortHand

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

    def style
      {top: @state[:top]}.merge(@props[:visible] ? {display: 'block'} : {display: 'none'})
    end

    def header
      nil
    end

    def content
      nil
    end

    def render
      section({className: "page #{page_class_name}", style: style}, header, content)
    end
  end
end
