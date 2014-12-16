# encoding: utf-8
require 'test/unit'
require_relative '../lib/kowabana/parser'
require 'pry-byebug'

class TestKowabanaParser < Test::Unit::TestCase
  def setup
    @parser = Kowabana::Parser.new
  end

  def test_parse!
    @parser.text = <<-EOS
aaaaaaaaaaaa
bbbbbbbbbbbb

cccccccccccc


dddddddddddd
    EOS
    @parser.parse!
    assert [] == @parser.wallpaper_ids

    @parser.text = <<-EOS2
aaaaaaaaaaaa
wallpaper:1

wallpaper:2


wallpaper:4
bbbbbbbbbbbb
    EOS2
    @parser.parse!
    assert_equal [1, 2, 4], @parser.wallpaper_ids
  end
end
