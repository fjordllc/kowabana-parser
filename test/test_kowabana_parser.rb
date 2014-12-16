# encoding: utf-8
require 'test/unit'
require_relative '../lib/kowabana/parser'

class TestParser < Test::Unit::TestCase
  def setup
    @parser = Kowabana::Parser.new
  end

  def test_parse!
    @parser.text <<-EOS
aaaaaaaaaaaa
bbbbbbbbbbbb

cccccccccccc


dddddddddddd
    EOS
    @parser.parse!
    assert [] == @parser.wallpaper_ids
  end
end
