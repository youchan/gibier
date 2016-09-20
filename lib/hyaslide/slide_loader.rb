require 'rouge'
require 'fssm'
require 'eventmachine'
require 'redcarpet'

require_relative './render_hyaslide'

module Hyaslide
  class SlideLoader
    def initialize(dir)
      @dir = dir
    end

    def self.load_slide(dir)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::Hyaslide, fenced_code_blocks: true)
      File.open("#{dir}/pages/pages.rb", "w+") do |f|
        data = File.read("#{dir}/slide.md")
        f.write markdown.render(data)
      end
    end

    def run
      Hyaslide::SlideLoader.load_slide(@dir)

      EM.defer do
        FSSM.monitor("#{@dir}", "slide.md") do
          update {|base, relative| SlideLoader.load_slide }
          delete {|base, relative|}
          create {|base, relative|}
        end
      end
    end
  end
end
