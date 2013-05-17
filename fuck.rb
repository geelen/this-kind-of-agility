require 'nokogiri'
require 'open-uri'
require 'json'

doc = Nokogiri::HTML(open("http://arresteddevelopment.wikia.com/wiki/Category:Arrested_Development_Episodes"))

data = doc.css('#mw-content-text >div:nth-of-type(3n+4)').each_with_index.map { |ffs, i|
  {
    episode: i + 1,
    screencap: ffs.css('>div >a >img').attr('data-src').value,
    byline: ffs.css('>div:nth-child(3)').text,
    title: ffs.css('>div:nth-child(2) a').text,
    synopsis: ffs.css('>div:nth-child(4)').text,
    airdate: ffs.css('>div:nth-child(2) span').text
  }
}[0,53]

puts JSON.pretty_generate(data)
