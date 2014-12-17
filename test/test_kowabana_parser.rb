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
    assert { [] == @parser.wallpaper_ids }
    assert { [] == @parser.music_ids }
    assert { [] == @parser.sound_ids }
    plain = [
      'aaaaaaaaaaaa',
      'bbbbbbbbbbbb',
      'cccccccccccc',
      'dddddddddddd'
    ]
    assert { plain == @parser.plain_texts }
  end

  def test_command_parse!
    @parser.text = <<-EOS2
music:1
aaaaaaaaaaaa
wallpaper:1
music:3
shake
wallpaper:2
sound:1
nextpage

wallpaper:4
bbbbbbbbbbbb
sound:3
    EOS2
    @parser.parse!
    assert { [1, 2, 4] == @parser.wallpaper_ids }
    assert { [1, 3] == @parser.music_ids }
    assert { [1, 3] == @parser.sound_ids }
    plain = [
      'aaaaaaaaaaaa',
      'bbbbbbbbbbbb'
    ]
    assert { plain == @parser.plain_texts }
  end
end
