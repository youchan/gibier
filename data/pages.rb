class Hyaslide::Page0 < Hyaslide::PageBase
  def header
    h1(nil, 'Writing web application in Ruby')
  end

  def content
    [].tap do |children|
    end
  end
end

class Hyaslide::Page1 < Hyaslide::PageBase
  def header
    h2(nil, 'Who am I?')
  end

  def content
    [].tap do |children|
children << ul(nil,
              li(nil, 'Ubiregi inc.'),
              li(nil, 'from Java to Ruby'),
nil)
    end
  end
end

class Hyaslide::Page2 < Hyaslide::PageBase
  def header
    h2(nil, 'Prologue')
  end

  def content
    [].tap do |children|
children << ul(nil,
              li(nil, 'iPad + API'),
              li(nil, 'Ruby on Rails'),
              li(nil, 'but...'),
              li(nil, 'Dashboard web frontend javascript'),
nil)
    end
  end
end

class Hyaslide::Page3 < Hyaslide::PageBase
  def header
    h2(nil, 'Dashboard')
  end

  def content
    [].tap do |children|
children << ul(nil,
              li(nil, 'Web frontend'),
              li(nil, 'Backbone.js => React.js'),
nil)
    end
  end
end

class Hyaslide::Page4 < Hyaslide::PageBase
  def header
    h2(nil, 'React.js')
  end

  def content
    [].tap do |children|
children << ul(nil,
              li(nil, 'ReactNative'),
              li(nil, '話題になってるけどrubyistとしては蚊帳の外の感'),
nil)
    end
  end
end

class Hyaslide::Page5 < Hyaslide::PageBase
  def header
    h2(nil, 'gohra')
  end

  def content
    [].tap do |children|
children << ul(nil,
              li(nil, 'Card game engine'),
              li(nil, 'Descript the rule of game in Ruby DSL'),
              li(nil, 'Hobby programming'),
              li(nil, 'Frontend => ?'),
nil)
    end
  end
end

class Hyaslide::Page6 < Hyaslide::PageBase
  def header
    h2(nil, 'Hyalite')
  end

  def content
    [].tap do |children|
children << ul(nil,
              li(nil, 'Ruby(Opal)'),
nil)
    end
  end
end

class Hyaslide::Page7 < Hyaslide::PageBase
  def header
    h2(nil, 'Opal')
  end

  def content
    [].tap do |children|
children << ul(nil,
              li(nil, '思いのほかちゃんと動く'),
nil)
    end
  end
end

class Hyaslide::Page8 < Hyaslide::PageBase
  def header
    h2(nil, 'Virtual DOM')
  end

  def content
    [].tap do |children|
    end
  end
end

class Hyaslide::Page9 < Hyaslide::PageBase
  def header
    h2(nil, 'Short hand')
  end

  def content
    [].tap do |children|
    end
  end
end

class Hyaslide::Page10 < Hyaslide::PageBase
  def header
    h2(nil, 'Example')
  end

  def content
    [].tap do |children|
children << ul(nil,
              li(nil, 'Todo MVC'),
nil)
    end
  end
end

class Hyaslide::Page11 < Hyaslide::PageBase
  def header
    h2(nil, 'isomophic')
  end

  def content
    [].tap do |children|
    end
  end
end

Hyaslide.page_count = 12
