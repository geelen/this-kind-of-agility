require 'nokogiri'
require 'json'
require './netflix_catalog'

doc = NetflixCatalog.new
parser = Nokogiri::XML::SAX::Parser.new(doc)
parser.parse_file("netflix-full-catalog.xml")

puts JSON.pretty_generate(doc.films)
