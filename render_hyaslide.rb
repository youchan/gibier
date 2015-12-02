require 'unindent'

module Redcarpet
  module Render
    class Hyaslide < Base
      def initialize
        super
        @enter_title_page = false
        @enter_page = false
        @page_count = 0
        @enter_list = false
      end

      [
        # block-level calls
        :block_code, :block_quote,
        :block_html,

        # span-level calls
        :autolink, :codespan,
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

      def header(text, header_level)
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

          case header_level
          when 1
            @enter_title_page = true
            header = "h1(nil, '#{text}')"
          when 2,3,4
            @enter_page = true
            header = "h2(nil, '#{text}')"
          end

          result <<
<<EOD
class Hyaslide::Page#{@page_count} < Hyaslide::PageBase
  def header
    #{header}
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
EOD
      end

      def list_item(item, orderd)
        "              li(nil, '#{item.strip}'),\n"
      end

      def list(text, ordered)
        "".tap do |result|
          result << "children << ul(nil,\n"
          result << text
          result << "nil)\n"
        end
      end

      def emphasis(*args)
        "# #{args}"
      end

      def double_emphasis(*args)
        "## #{args}"
      end

      def link(link, title, content)
        "#{content} (#{link})"
      end

      def image(link, title, content)
        content &&= content + " "
        "#{content}#{link}"
      end

      def paragraph(text)
        "children << p(nil, '#{text}')\n"
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
