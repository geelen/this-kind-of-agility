require 'nokogiri'
require './netflix_catalog'

def load_catalog
  doc = NetflixCatalog.new
  parser = Nokogiri::XML::SAX::Parser.new(doc)
  parser.parse_file("netflix-full-catalog.xml")
  doc
end
