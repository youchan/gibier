require 'unindent'
require 'rouge'
require 'redcarpet'

class String
  def escape
    if self =~ /<a>(.*)<\/a>/
      "a(#{$1})"
    elsif self =~ /<p>(.*)<img>(.*)<\/img><\/p>/
      "p(#{$1}, img(#{$2}))"
    elsif self =~ /<div>(.*)<\/div>/
      "div(#{$1})"
    elsif self =~ /<strong>(.*)<\/strong>/
      "strong(nil, \"#{$1}\")"
    else
      "\"#{self.gsub(/\"/, "\\\"").gsub(/\\/, "\\\\")}\""
    end
  end
end

module Gibier
  class Renderer < Redcarpet::Render::Base
    def self.create(name)
      Class.new(Renderer) do
        def self.page_name
          @page_name
        end

        def self.page_name=(name)
          @page_name = name
        end

        def page_name
          self.class.page_name
        end
      end.tap{|c| c.page_name = name }
    end

    def initialize
      super
      @enter_title_page = false
      @enter_page = false
      @page_count = 0
      clear_list_state
    end

    def clear_list_state
      @enter_list = false
      @list_depth = 0
    end

    [
      # block-level calls
      :block_quote,

      # span-level calls
      :autolink,
      :underline, :raw_html,
      :triple_emphasis, :strikethrough,
      :superscript, :highlight,

      # footnotes
      :footnotes, :footnote_def, :footnote_ref,

      # low level rendering
      #:entity, :normal_text
    ].each do |method|
      define_method method do |*args|
        "#{method} #{args.first}"
      end
    end

    def hrule
      clear_list_state
      "".tap do |result|
        if @enter_title_page || @enter_page
          result <<
<<EOD
  end
end
end

EOD
          @enter_title_page = @enter_page = false
        end

        result << <<EOD
class Gibier::Page#{@page_count} < Gibier::PageBase
def content
  [].tap do |children|
EOD

        @enter_page = true
        @page_count += 1
      end
    end

    def header(text, header_level)
      clear_list_state

      if header_level > 3
        return "      children << h#{header_level}(nil, #{text.escape})\n"
      end

      "".tap do |result|
        if @enter_title_page || @enter_page
          result <<
<<EOD
  end
end
end

EOD
          @enter_title_page = @enter_page = false
        end

        if header_level == 1
          @enter_title_page = true
          @title = text.escape
        else
          @enter_page = true
        end


        result <<
<<EOD
class Gibier::Page#{@page_count} < Gibier::PageBase
def header
  h#{header_level}(nil, #{text.escape})
end

def content
  [].tap do |children|
EOD

        @page_count += 1
      end
    end

    def doc_footer(*args)
<<EOD
  end
end
end

Gibier.page_count = #{@page_count}
Gibier.title = #{@title}
EOD
    end

    def list_item(item, orderd)
      "".tap do |result|
        if item =~ /.*\n +children << /
          result << item.sub(/(.*)\n +children << /) { "                  li(nil, #{$1.strip.escape}),\n                  " }.rstrip
          result << ",\n"
          @enter_list = false
        else
          result << "                    li(nil, #{item.strip.escape}),\n"
        end
      end
    end

    def list(text, ordered)
      "".tap do |result|
        result << "      children << ul(nil,\n"
        result << text.sub(/,\n\z/, "\n")
        result << "      )\n"
        @enter_list = false
      end
    end

    def link(link, title, content)
      link or return
      "<a>{href: #{link.escape}, target: \"_blank\"}, #{content.escape}</a>"
    end

    def image(link, title, alt_text)
      href = "assets/#{page_name}/images/#{link}"
      "<p>{class: \"#{alt_text}\"}<img>{src: #{href.escape}}</img></p>"
    end

    def block_code(code, language)
      clear_list_state

      formatter = Rouge::Formatters::HTML.new(css_class: 'highlight', line_numbers: true)
      lexer = case language
              when 'ruby'
                Rouge::Lexers::Ruby.new
              when 'javascript'
                Rouge::Lexers::Javascript.new
              else
                Rouge::Lexers::PlainText.new
              end
      highlight = formatter.format(lexer.lex(code))
      "      children << code({ dangerouslySetInnerHTML: { __html: %q{#{highlight}} } })\n"
    end

    def block_html(html)
      clear_list_state
      "      children << code({ dangerouslySetInnerHTML: { __html: %q{#{html}} } })\n"
    end

    def emphasis(*args)
      "# #{args}"
    end

    def double_emphasis(*args)
      "<strong>#{args.first}</strong>"
    end

    def paragraph(text)
      lines = text.split(/  $/)
      if text[0] == '%'
        class_name = text[1...text.index(':')]
        lines[0] = lines.first[(lines.first.index(':') + 1)...lines.first.length].lstrip
        "      children << p({className:\"#{class_name}\"}, #{lines.map{|l| l.escape}.join(',Hyalite.create_element(\'br\'),')})\n"
      else
        "      children << p(nil, #{lines.map{|l| l.escape}.join(',Hyalite.create_element(\'br\'),')})\n"
      end
    end

    def table(header, body)
      "#{header}#{body}"
    end

    def table_row(content)
      content + "\n"
    end

    def table_cell(content, alignment)
      content + "\t"
    end
  end
end
