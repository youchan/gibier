require 'thor'
require 'fileutils'
require 'pathname'
require 'rouge'
require 'opal'
require 'haml'
require 'gibier/haml_helper'
require 'gibier/static_generator'

module Gibier
  class Cli < Thor
    include HamlHelper

    desc 'new', 'Create new project'

    def new(name)
      puts "Create new project '#{name}'"

      FileUtils.mkdir name
      dir = Dir.new(__dir__+'/../../template/project')
      dir.each do |file|
        next if file == '..'
        FileUtils.cp_r(dir.path + '/' + file, name)
      end
    end

    desc 'highlight', 'Generate highlight.css'

    def highlight
      puts Rouge::Themes::Base16.mode(:dark).render(scope: '.highlight')
    end

    desc 'ghpages', 'Create GitHub Pages'
    option :name, type: :string, aliases: '-n', desc: 'Create GitHub Pages specified name'
    def ghpages
      puts "Create static pages"

      FileUtils.mkdir_p 'docs'
      assets_dir = Dir.new(__dir__ + '/../../template/project/assets')
      FileUtils.cp_r(assets_dir.path, 'docs')

      generator = StaticGenerator.new('data', 'docs')
      if options[:name]
        generator.generate_page(options[:name], 'assets', 'docs')
      else
        generator.generate_pages
      end
    end

  end
end

