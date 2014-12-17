# kowabana-parser

![TravisCI Build Status](https://secure.travis-ci.org/fjordllc/kowabana-parser.png)

Parsing KML(Kowabana Markup Language).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kowabana-parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kowabana-parser

## Usage

```ruby
parser = Kowabana::Parser.new(<<-EOS)
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

parser.wallpaper_ids #=> [1, 2, 4]
parser.music_ids #=> [1, 3]
parser.sound_ids #=> [1, 3]
parser.plain_texts #=> ['aaaaaaaaaaaa', 'bbbbbbbbbbbb']
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/kowabana-parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
