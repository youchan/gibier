require 'bundler'
Bundler.require

require 'fssm'
require 'eventmachine'
require 'redcarpet'
require_relative './render_hyaslide'

class SlideLoader
  def self.load_slide
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::Hyaslide.new)
    File.open("data/pages.rb", "w+") do |f|
      data = File.read("data/slide.md")
      f.write markdown.render(data)
    end
  end

  def run
    SlideLoader.load_slide

    EM.defer do
      FSSM.monitor("#{__dir__}/data/", "slide.md") do
        update {|base, relative| SlideLoader.load_slide }
        delete {|base, relative|}
        create {|base, relative|}
      end
    end
  end
end

SlideLoader.new.run

run Opal::Server.new { |s|
  s.append_path 'app'
  s.append_path 'data'
  s.append_path '../../hyalite/client'

  s.debug = true
  s.main = 'application'
  s.index_path = 'index.html.haml'
}
