require 'slide'
require 'page_base'
require 'slides/#{name}/pages'

Hyaslide.slide_name = '#{name}'

module App
  def self.render
    Hyalite.render(Hyalite.create_element(Hyaslide::Slide, nil), $document['.hyaslide'])
  end
end

$document.ready do
  $window.on(:resize) do
    App.render
  end

  App.render
end
