class PageBackground
  include Hyalite::Component

  def background
    []
  end

  def render
    div({class: 'page-background', style: {zoom: @props[:zoom]}}, background)
  end
end
