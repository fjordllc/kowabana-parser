require 'kowabana/parser/version'

module Kowabana
  class Parser
    attr_accessor :text
    attr_reader :wallpaper_ids

    def initialize(text)
      @text = text
      @wallpaper_ids = []
    end

    def parse!
      cleanup!
      @text.split("\n").each do |line|
        case line.strip!
        when /wallpaper:(\d)/
          @wallpaper_ids << line.split(':').last.to_i
        end
      end
    end

    private

    def cleanup!
      @text.gsub!(/(\r\n|\r)/, "\n").gsub!(/\n+/, "\n")
    end
  end
end
