class NetflixCatalog < Nokogiri::XML::SAX::Document
  attr_reader :films

  FILM_ELEMENT_NAME = "catalog_title"
  AVAILABILITY_ELEMENT_NAME = "availability"

  class ParsingError < RuntimeError; end

  def start_document
    @films = []
  end

  def start_element(element_name, attributes)
    try_with_meaningful_error_wrapping do
      case element_name
      when FILM_ELEMENT_NAME
        open_film_element
      when AVAILABILITY_ELEMENT_NAME
        # <availability available_from="1283324400" available_until="4102444800"><category scheme="http://api-public.netflix.com/categories/title_formats" label="instant" term="instant">
        open_availability_element(attributes)
      when 'id'
        # <id>http://api-public.netflix.com/catalog/titles/movies/670874</id>
        if is_primary_id?(attributes)
          open_text_element(element_name)
        end
      when 'link'
        # <link href="http://www.netflix.com/Movie/Killer_s_Kiss/670874" rel="alternate" title="web page"></link>
        if is_web_link?(attributes)
          store_web_link(attributes)
        end
      when 'category'
        # <avaliablity ... >
        #   <category scheme="http://api-public.netflix.com/categories/title_formats" label="instant" term="instant">
        if is_instant_availability?(attributes)
          mark_current_availability_element_as_instant
        end
      when 'title'
        # <title short="The Office: Season 1" regular="The Office: Season 1"/>
        extract_titles(attributes)
      when 'release_year'
        # <release_year>2005</release_year>
        open_text_element(element_name)
      end
    end
  end

  def end_element(element_name)
    try_with_meaningful_error_wrapping do
      if element_name == FILM_ELEMENT_NAME
        close_film_element
      elsif element_name == AVAILABILITY_ELEMENT_NAME
        close_availability_element
      elsif is_open_text_element?(element_name)
        close_text_element
      end
    end
  end

  def characters(inner_text)
    try_with_meaningful_error_wrapping do
      if film_element_open? && text_element_open?
        write_text_element(inner_text)
      end
    end
  end

private
  def try_with_meaningful_error_wrapping(&block)
    begin
      block.call
    rescue => exc
      raise ParsingError, "Parsing Lol: #{exc.class} - #{exc.message}\nCurrent Film in Feed:\n\n#{@current_film.inspect}", exc.backtrace
    end
  end

  def film_element_open?
    @current_film
  end

  def open_film_element
    @current_film = {}
  end

  def close_film_element
    if @current_film['availability'] && @current_film['title'] =~ /arrested development: season [0-9]:/i
      @films << @current_film
    end
  end

  def open_availability_element(attributes)
    @current_availability = Hash[*attributes.flatten]
  end

  def extract_titles(attributes)
    attributes.each do |key, value|
      @current_film["title"] = value if key == "regular"
      @current_film["short_title"] = value if key == "short_regular"
    end
  end

  def is_instant_availability?(attributes)
    # inside a <availability> element
    # <category scheme="http://api.netflix.com/categories/title_formats" label="instant" term="instant"></category>
    @current_availability &&
    attributes.any? { |key, value| key == 'label' && value == 'instant' } &&
    attributes.none? { |key, value| key == 'status' && value == 'deprecated' }
  end

  def close_availability_element
    if @current_availability['instant']
      @current_film['availability'] = @current_availability
    end
    @current_availability = nil
  end

  def text_element_open?
    @current_text_element
  end

  def is_open_text_element?(element_name)
    @current_text_element == element_name
  end

  def open_text_element(element_name)
    @current_text_element = element_name
  end

  def write_text_element(inner_text)
    @current_film[@current_text_element] = inner_text
  end

  def close_text_element
    @current_text_element = nil
  end

  def is_primary_id?(attributes)
    attributes.size == 0
  end

  def is_web_link?(attributes)
    attributes.any?  { |key, value| key == "rel" && value == "alternate" }
  end

  def store_web_link(attributes)
    # <link href="http://www.netflix.com/Movie/Careful_with_Credit/70031193" rel="alternate" title="web page"></link>
    link = attributes.detect { |key, value| key == 'href' }
    @current_film['link'] = link[1]
  end

  def mark_current_availability_element_as_instant
    @current_availability['instant'] = true
  end

end
