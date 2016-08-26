require 'unindent'
require 'rouge'

class String
  def escape
    if self =~ /<a>(.*)<\/a>/
      "a(#{$1})"
    elsif self =~ /<img>(.*)<\/img>/
      "img(#{$1})"
    elsif self =~ /<div>(.*)<\/div>/
      "div(#{$1})"
    elsif self =~ /<strong>(.*)<\/strong>/
      "strong(nil, \"#{$1}\")"
    else
      "\"#{self.gsub(/\"/, "\\\"").gsub(/\\/, "\\\\")}\""
    end
  end
end

module Redcarpet
  module Render
    class Hyaslide < Base
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
class Hyaslide::Page#{@page_count} < Hyaslide::PageBase
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
class Hyaslide::Page#{@page_count} < Hyaslide::PageBase
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

Hyaslide.page_count = #{@page_count}
Hyaslide.title = #{@title}
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
        "<a>{href: #{link.escape}, target: \"_blank\"}, #{content.escape}</a>"
      end

      def image(link, title, alt_text)
        "<img>{className: \"#{alt_text}\", src: #{link.escape}}</img>"
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
        if text[0] == '%'
          class_name = text[1...text.index(':')]
          text = text[(text.index(':') + 1)...text.length].lstrip
          "      children << p({className:\"#{class_name}\"}, #{text.escape})\n"
        else
          "      children << p(nil, #{text.escape})\n"
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
end
