require 'rouge'
require 'fssm'
require 'eventmachine'
require 'redcarpet'

require_relative './renderer'

module Gibier
  class SlideLoader

    attr_reader :slides

    def initialize
      @slides = []
    end

    def init_slide(name)
      Dir.mkdir('app/slides') unless Dir.exist?('app/slides')
      Dir.mkdir('app/scripts') unless Dir.exist?('app/scripts')
      Dir.mkdir(SlideLoader.src_path(name)) unless Dir.exist?(SlideLoader.src_path(name))
      Dir.mkdir(SlideLoader.script_path(name)) unless Dir.exist?(SlideLoader.script_path(name))

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
        markdown = Redcarpet::Markdown.new(Gibier::Renderer.create(name), fenced_code_blocks: true)
        f.write markdown.render(data)
      end

      if File.exist?("data/#{name}/script.md")
        File.open("#{script_path(name)}/script.html", "w+") do |f|
          script = File.read("data/#{name}/script.md")
          markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(hard_wrap: true), autolink: true, fenced_code_blocks: true)
          f.write markdown.render(script)
        end
      end

      File.open("#{src_path(name)}/app.rb", "w+") do |f|
        f.write Tilt::StringTemplate.new(File.expand_path('../../../template/app.rb', __FILE__)).render(Object.new, name: name)
      end

      File.open("#{src_path(name)}/script.rb", "w+") do |f|
        f.write Tilt::StringTemplate.new(File.expand_path('../../../template/script.rb', __FILE__)).render(Object.new, name: name)
      end
    rescue => e
      p e
    end

    def self.src_path(name)
      "app/slides/#{name}"
    end

    def self.script_path(name)
      "app/scripts/#{name}"
    end

    def add_slide(name)
      init_slide(name)

      EM.defer do
        FSSM.monitor("data/#{name}", %w(slide.md script.md)) do
          update {|base, relative| Gibier::SlideLoader.load_slide(name) }
          delete {|base, relative|}
          create {|base, relative|}
        end
      end
    end
  end
end
