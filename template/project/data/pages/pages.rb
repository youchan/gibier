class Hyaslide::Page0 < Hyaslide::PageBase
  def header
    h1(nil, "Title")
  end

  def content
    [].tap do |children|
      children << p({className:"author"}, "Your Name")
    end
  end
end

class Hyaslide::Page1 < Hyaslide::PageBase
  def content
    [].tap do |children|
      children << h4(nil, "Press 's' then starting the race of rabbit and turtle.")
    end
  end
end

class Hyaslide::Page2 < Hyaslide::PageBase
  def header
    h2(nil, "Slide")
  end

  def content
    [].tap do |children|
      children << ul(nil,
                    li(nil, "Listing"),
                    li(nil, "...")
      )
    end
  end
end

Hyaslide.page_count = 3
Hyaslide.title = "Title"
