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

    desc 'static', 'Create Static Pages'
    option :name, type: :string, aliases: '-n', desc: 'Specify slide name'
    option :dir, type: :string, aliases: '-d', desc: 'Specify target directory'
    def static
      puts "Create Static Pages"

      target_dir = options[:dir] || 'docs'
      FileUtils.mkdir_p target_dir
      assets_dir = Dir.new(__dir__ + '/../../template/project/assets')
      FileUtils.cp_r(assets_dir.path, target_dir)

      generator = StaticGenerator.new('data', target_dir)
      if options[:name]
        generator.generate_page(options[:name], 'assets', target_dir)
      else
        generator.generate_pages('../assets')
      end
    end

    map ghpages: :static
  end
end

