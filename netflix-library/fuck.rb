require 'nokogiri'
require 'open-uri'
require 'json'
require './load_arrested_dev_catalog'
require 'pry'

wiki_doc = Nokogiri::HTML(open("http://arresteddevelopment.wikia.com/wiki/Category:Arrested_Development_Episodes"))
netflix_doc = load_catalog

def get_url_for_episode(netflix_doc, season, title)
  # TODO you might need to write a better matcher.
  url = netflix_doc.films.first { |film|
    film["title"].downcase.contains?(title.downcase)
  }["id"]
  id = url.split("/").last
  
  # This url appears to work
  "http://movies.netflix.com/WiPlayer?movieid=#{id}&trkid=13220622"
end

def get_fun_fact(season, ep)
  url = "http://recurringdevelopments.com/api/get/episode/S#{season.to_s.rjust(2, "0")}E#{ep.to_s.rjust(2, "0")}"
  raw_doc = open(url).read
  if raw_doc != "false"
    doc = JSON.parse(raw_doc)
    doc["fun_fact"]
  end
end

ep_seasons = 22.times.map { |i| [i+1, 1] } +
  18.times.map { |i| [i+1, 2] } +
  13.times.map { |i| [i+1, 3] }
data = wiki_doc.css('#mw-content-text >div:nth-of-type(3n+4)')[0,53].each_with_index.map { |ffs, i|
  season = ep_seasons[i].last
  season_ep = ep_seasons[i].first
  episode = i + 1
  title = ffs.css('>div:nth-child(2) a').text
  {
    episode: episode,
    season: season,
    season_ep: season_ep,
    screencap: ffs.css('>div >a >img').attr('data-src').value,
    director: ffs.css('>div:nth-child(3)').text.split(/ *[:-] /)[1],
    writer: ffs.css('>div:nth-child(3)').text.split(/ *[:-] /)[3],
    title: title,
    synopsis: ffs.css('>div:nth-child(4)').text,
    airdate: ffs.css('>div:nth-child(2) span').text,
    url: get_url_for_episode(netflix_doc, season, title),
    fun_fact: get_fun_fact(season, season_ep)
  }
}

puts JSON.pretty_generate(data)
