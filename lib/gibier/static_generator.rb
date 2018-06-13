module Gibier
  class StaticGenerator
    include HamlHelper

    def initialize(data_dir, target_dir)
      @data_dir = data_dir
      @target_dir = target_dir
      @slide_loader = Gibier::SlideLoader.new
    end

    def generate_pages(assets_path = 'assets')
      Gibier::SlideHelper.each_slides(@data_dir) do |name|
        generate_page(name, assets_path)
      end

      convert_html(File.expand_path('../views/index.haml', @data_dir), "docs/index.html", slides: @slide_loader.slides)
      FileUtils.cp_r(File.expand_path('../assets', @data_dir), "docs")
    end

    def generate_page(name, assets_path = 'assets', slide_dir = nil)
      @slide_loader.init_slide(name)
      src_dir = "#{@data_dir}/#{name}"

      slide_dir =  "#{@target_dir}/#{name}" unless slide_dir
      FileUtils.mkdir_p slide_dir
      slide_haml = File.expand_path('../views/slide.haml', @data_dir)
      convert_html(slide_haml, "#{slide_dir}/index.html", slide_name: name, static: true, assets_path: assets_path)

      assets_dir = "#{@target_dir}/assets/#{name}"
      FileUtils.mkdir_p assets_dir

      FileUtils.cp_r("#{src_dir}/css", assets_dir)
      FileUtils.cp_r("#{src_dir}/images", assets_dir)

      js_dir =  "#{@target_dir}/assets/#{name}/javascripts"
      FileUtils.mkdir_p js_dir
      build(name, "#{js_dir}/application.js")
    end

    private

    def build(name, filename)
      builder = Opal::Builder.new

      use_gem(builder, 'opal-router', 'opal')

      builder.append_paths './app'
      builder.use_gem 'hyalite'
      builder.use_gem 'opal-websocket'
      builder.use_gem 'gibier'
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
