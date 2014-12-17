require 'kowabana/parser/version'

module Kowabana
  class Parser
    attr_accessor :text, :texts, :plain_texts
    attr_reader :wallpaper_ids, :music_ids, :sound_ids

    def initialize(text = '')
      @text = text
      @plain_texts = []
      @wallpaper_ids = []
      @music_ids = []
      @sound_ids = []
    end

    def parse!
      cleanup!
      @texts.each do |line|
        case line
        when /^wallpaper:\d+$/
          @wallpaper_ids << line.split(':').last.to_i
        when /^music:\d+$/
          @music_ids << line.split(':').last.to_i
        when /^sound:\d+$/
          @sound_ids << line.split(':').last.to_i
        when /^shake$/
          # do nothing
        when /^nextpage$/
          # do nothing
        else
          @plain_texts << line
        end
      end

      @wallpaper_ids.uniq!
      @music_ids.uniq!
      @sound_ids.uniq!
    end

    private

    def cleanup!
      @text = @text.gsub(/(\r\n|\r)/, "\n").gsub(/\n+/, "\n")
      @texts = @text.split("\n").map(&:strip)
    end
  end
end
