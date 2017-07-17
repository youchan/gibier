module Gibier
  class SlideHelper
    def self.each_slides(dir = 'data')
      Dir.foreach(dir) do |dir_name|
        if !dir_name.start_with?('.') && File.directory?("#{dir}/#{dir_name}")
          yield dir_name
        end
      end
    end

    def self.slides(dir = 'data')
      SlideIterator.new(dir).to_enum
    end

    class SlideIterator
      def initialize(dir)
        @dir = dir
      end

      def each(&block)
        SlideHelper.each_slides(@dir, &block)
      end
    end
  end
end
