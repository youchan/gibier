class Page1
  include Hyalite::Component
  include Hyalite::Component::ShortHand

  def render
    style = @props[:visible] ? {display: 'block'} : {display: 'none'}

    section({className: 'page', style: style}, h1(nil, 'Slide test'))
  end
end

class Page2
  include Hyalite::Component
  include Hyalite::Component::ShortHand

  def render
    style = @props[:visible] ? {display: 'block'} : {display: 'none'}

    section({className: 'page', style: style},
      h1(nil, 'Slide page2')
    )
  end
end
