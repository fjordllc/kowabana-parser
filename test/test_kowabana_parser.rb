# encoding: utf-8
require 'test/unit'
require_relative '../lib/kowabana/parser'

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
    @parser.text = <<-EOS
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
    EOS
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

  def test_redundant_wallpaper_id
    @parser.text = <<-EOS
wallpaper:1
wallpaper:1
wallpaper:2
wallpaper:4
    EOS
    @parser.parse!
    assert { [1, 2, 4] == @parser.wallpaper_ids }
  end

  def test_redundant_music_id
    @parser.text = <<-EOS
music:1
music:2
music:2
music:4
    EOS
    @parser.parse!
    assert { [1, 2, 4] == @parser.music_ids }
  end

  def test_redundant_sound_id
    @parser.text = <<-EOS
sound:1
sound:2
sound:4
sound:4
    EOS
    @parser.parse!
    assert { [1, 2, 4] == @parser.sound_ids }
  end
end
