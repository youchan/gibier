require 'thor'
require 'fileutils'
require 'pathname'
require 'rouge'
require 'opal'
require 'haml'

module Gibier
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

    desc 'ghpages', 'create static pages'

    def ghpages
      puts "Create static pages"

      FileUtils.mkdir_p 'docs'
      assets_dir = Dir.new(__dir__ + '/../../template/project/assets')
      FileUtils.cp_r(assets_dir.path, 'docs')

      slide_loader = Gibier::SlideLoader.new
      Gibier::SlideHelper.each_slides('data') do |name|
        slide_loader.init_slide(name)

        FileUtils.mkdir_p "docs/assets/#{name}"
        FileUtils.cp_r("data/#{name}/css", "docs/assets/#{name}")
        FileUtils.cp_r("data/#{name}/images", "docs/assets/#{name}")

        FileUtils.mkdir_p "docs/#{name}"
        convert_html(File.expand_path('../../../template/gh_pages/slide.haml', __FILE__), "docs/#{name}/index.html", slide_name: name)

        FileUtils.mkdir_p "docs/assets/#{name}/javascripts"
        build(name, "docs/assets/#{name}/javascripts/application.js")
      end

      convert_html(File.expand_path('../../../template/gh_pages/index.haml', __FILE__), "docs/index.html", slides: slide_loader.slides)
    end

    private

    def convert_html(haml_file, html_file, **instance_vars)
      File.open(html_file, "w") do |f|
        engine = Haml::Engine.new(File.read(haml_file))
        context = Object.new
        instance_vars.each do |key, value|
          context.instance_variable_set(:"@#{key}", value)
        end
        f.write engine.render(context) # Tilt::StringTemplate.new().render
      end
    end

    def build(name, filename)
      builder = Opal::Builder.new

      use_gem(builder, 'opal-browser', 'opal')
      use_gem(builder, 'opal-router', 'opal')
      use_gem(builder, 'hyalite', 'client')

      builder.append_paths './app'
      builder.use_gem 'gibier'
      builder.use_gem 'paggio'
      builder.build "./app/slides/#{name}/app.rb"

      File.open(filename, 'w') do |file|
        file.write builder.to_s
      end

    end

    def use_gem(builder, name, opal_path)
      spec = Gem::Specification.find_by_name name
      lib_path = Pathname.new spec.full_require_paths.first
      opal_path = lib_path.parent + opal_path
      builder.append_paths opal_path.to_s
    end
  end
end

