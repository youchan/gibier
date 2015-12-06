require 'browser/interval'

module Hyaslide
  class TrackField
    include Hyalite::Component
    include Hyalite::Component::ShortHand

    def initialize
      super
      @width = 0
    end

    def initial_state
      { tic: false }
    end

    def component_did_mount
      every(1) do
        set_state(tic: !@state[:tic])
        if el = $document.css(".track-field")[0]
          @width = el.width.to_i
          spend_time = @props[:start] ? Time.now - @props[:start] : 0
          matz_pos = [(spend_time / @props[:total_time]), 1].min * (@width - 40) * 0.96 + @width * 0.02
          set_state(matz_pos: matz_pos)
        end
      end
    end

    def render
      youchan_pos = (@props[:page_number] / @props[:page_count]) * (@width - 40) * 0.96 + @width * 0.02
      mstyle = {transform: "rotate(#{@state[:tic]?'-':''}7deg)", left: "#{@state[:matz_pos]}px"}
      ystyle = {transform: "rotate(#{@state[:tic]?'':'-'}7deg)"}
      ystyle.merge!(left: "#{youchan_pos}px") if @width > 0

      div({className: 'track-field'},
        @props[:start] ? [
          div({className: 'flag', style: {right: "#{@width * 0.02}px"}}),
          div({className: 'matz avatar', style: mstyle}),
          div({className: 'youchan avatar', style: ystyle})
        ] : nil)
    end
  end
end
