module Gibier
  class TrackField
    include Hyalite::Component

    def initialize
      super
      @width = 0
    end

    def initial_state
      { tic: false }
    end

    def component_did_mount
      func = Proc.new do
        set_state(tic: !@state[:tic])
        if el = $document[".track-field"].first
          @width = el.width.to_i
          spend_time = @props[:start] ? Time.now - @props[:start] : 0
          rabbit_pos = [(spend_time / @props[:total_time]), 1].min * (@width - 40) * 0.96 + @width * 0.02
          set_state(rabbit_pos: rabbit_pos)
        end
      end

      `setInterval(func, 1000)`
    end

    def render
      turtle_pos = (@props[:page_number] / @props[:page_count]) * (@width - 40) * 0.96 + @width * 0.02
      mstyle = {transform: "rotate(#{@state[:tic]?'-':''}7deg)", left: "#{@state[:rabbit_pos]}px"}
      ystyle = {transform: "rotate(#{@state[:tic]?'':'-'}7deg)"}
      ystyle.merge!(left: "#{turtle_pos}px") if @width > 0

      div({className: 'track-field'},
        @props[:start] ? [
          div({className: 'flag', style: {right: "#{@width * 0.02}px"}}),
          div({className: 'rabbit avatar', style: mstyle}),
          div({className: 'turtle avatar', style: ystyle})
        ] : nil)
    end
  end
end
