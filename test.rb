require 'redcarpet'
require_relative './render_hyaslide'

renderer = Redcarpet::Render::Hyaslide.new

markdown = Redcarpet::Markdown.new(renderer)

puts markdown.render <<"MARKDOWN"
test
----

## sdfas

aaaa
MARKDOWN
