class PageBackground
  include Hyalite::Component

  def background
    case @props[:page_number] 
    when 0
      [
        div({class: 'particleground'},
          div({class: 'logo'}),
          div({class: 'copyright'}, "© 2017 Retrieva, Inc.")
        ),
        div({class: 'vborder'})
      ]
    when Gibier.page_count - 1
      [
        div({class: 'particleground'},
          div({class: 'logo large'}),
          div({class: 'copyright'}, "© 2017 Retrieva, Inc.")
        ),
      ]
    else
      [
        div({class: 'border'}),
        div({class: 'dog'}),
        div({class: 'copyright'}, "© 2017 Retrieva, Inc.")
      ]
    end
  end

  def render
    div({class: 'page-background', style: {zoom: @props[:zoom]}}, background)
  end
end

