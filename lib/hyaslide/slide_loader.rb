require 'rouge'
require 'fssm'
require 'eventmachine'
require 'redcarpet'

require_relative './render_hyaslide'

module Hyaslide
  class SlideLoader

    attr_reader :slides

    def initialize
      @slides = []
    end

    def init_slide(name)
      Dir.mkdir('app/slides') unless Dir.exist?('app/slides')
      Dir.mkdir(SlideLoader.src_path(name)) unless Dir.exist?(SlideLoader.src_path(name))

      File.foreach("data/#{name}/slide.md") do |line|
        if line =~ /\A# (.+)/
          @slides << {name: name, title: $1}
          break
        end
      end

      SlideLoader.load_slide(name)
    end

    def self.load_slide(name)
      File.open("#{src_path(name)}/pages.rb", "w+") do |f|
        data = File.read("data/#{name}/slide.md")
        markdown = Redcarpet::Markdown.new(Hyaslide::Renderer.create(name), fenced_code_blocks: true)
        f.write markdown.render(data)
      end

      File.open("#{src_path(name)}/app.rb", "w+") do |f|
        f.write Tilt::StringTemplate.new(File.expand_path('../../../template/app.rb', __FILE__)).render(Object.new, name: name)
      end
    end

    def self.src_path(name)
      "app/slides/#{name}"
    end

    def add_slide(name)
      init_slide(name)

      EM.defer do
        FSSM.monitor("data/#{name}", "slide.md") do
          update {|base, relative| Hyaslide::SlideLoader.load_slide(name) }
          delete {|base, relative|}
          create {|base, relative|}
        end
      end
    end
  end
end
