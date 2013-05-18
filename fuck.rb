require 'nokogiri'
require 'open-uri'
require 'json'

doc = Nokogiri::HTML(open("http://arresteddevelopment.wikia.com/wiki/Category:Arrested_Development_Episodes"))

ep_seasons = 22.times.map { |i| [i+1, 1] } +
  18.times.map { |i| [i+1, 2] } +
  13.times.map { |i| [i+1, 3] }
data = doc.css('#mw-content-text >div:nth-of-type(3n+4)')[0,53].each_with_index.map { |ffs, i|
  {
    episode: i + 1,
    season: ep_seasons[i].last,
    season_ep: ep_seasons[i].first,
    screencap: ffs.css('>div >a >img').attr('data-src').value,
    director: ffs.css('>div:nth-child(3)').text.split(/ *[:-] /)[1],
    writer: ffs.css('>div:nth-child(3)').text.split(/ *[:-] /)[3],
    title: ffs.css('>div:nth-child(2) a').text,
    synopsis: ffs.css('>div:nth-child(4)').text,
    airdate: ffs.css('>div:nth-child(2) span').text
  }
}

puts JSON.pretty_generate(data)
