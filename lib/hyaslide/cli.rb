require 'thor'
require 'fileutils'
require 'rouge'

module Hyaslide
  class Cli < Thor
    desc 'new', 'create new project'

    def new(name)
      puts "Create new project '#{name}'"

      FileUtils.mkdir name
      dir = Dir.new(__dir__+'/../../template/project')
      dir.each do |file|
        next if file == '..'
        FileUtils.cp_r(dir.path + '/' + file, name)
      end
    end

    desc 'highlight', 'generate highlight.css'

    def highlight
      puts Rouge::Themes::Base16.mode(:dark).render(scope: '.highlight')
    end
  end
end

