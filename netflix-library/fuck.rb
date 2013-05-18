require 'nokogiri'
require 'open-uri'
require 'json'

wiki_doc = Nokogiri::HTML(open("http://arresteddevelopment.wikia.com/wiki/Category:Arrested_Development_Episodes"))
netflix_doc = JSON.load(File.open("netflix_eps.json", "r"))

def get_url_for_episode(netflix_doc, season, title)
  # TODO you might need to write a better matcher.
  # <div class="videoImagery" style="background-image: url(http://so0.akam.nflximg.com/soa2/731/1096779731.jpg);" data-video-id="70140358" data-season-id="70037510" data-episode-id="70133714"><div class="playButton"></div></div>
  # season 1 id 70003533
  # season 2 id 70020307
  # season 3 id 70037510
  # http://movies.netflix.com/WiPlayer?
  #   movieid=70133699&
  #   trkid=13220622&
  #   t=Sad%20Sack&
  #   btb=http%3A%2F%2Fthiskindofagilty.com%2FWiMovie%2FArrested_Development%2F70140358%3Fsod%3Dsearch-autocomplete

  # HAX
  title = "Forget Me Now" if title == "Forget-Me-Now"

  matching_thingo = netflix_doc.detect { |film|
    film["title"].downcase.include?(title.downcase)
  }

  if matching_thingo
    id = matching_thingo["id"].split("/").last
    
    # This url appears to work
    "http://movies.netflix.com/WiPlayer?movieid=#{id}&trkid=13220622&btb=http%3A%2F%2Fthiskindofagilty.com%2F"
  else
    raise "No matching ep found for #{title}"
  end
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
