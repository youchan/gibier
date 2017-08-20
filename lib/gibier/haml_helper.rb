module Gibier
  module HamlHelper
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
  end
end
