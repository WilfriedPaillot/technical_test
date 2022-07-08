require 'launchy'

class WebsiteGenerator
  def initialize(name, query)
    @name = name
    validate_name
    @query = query
    validate_query
  end

  def url
    send name
  end

  def open
    Launchy.open send(name)
  end

  private

  # COMPLETE NEXT LINE
  VALID_WEBSITES = %w[youtube github google amazon]

  # FIX EACH URL
  YOUTUBE_URL = 'https://www.youtube.com/results?search_query=lol+bonjour'
  GITHUB_URL = 'https://github.com/search?q=lol'
  GOOGLE_URL = 'https://www.google.com/search?q=lol'
  AMAZON_URL = 'https://www.amazon.fr/s?k=klol'

  def youtube
    YOUTUBE_URL + query_builder
  end

  def github
    GITHUB_URL + query_builder
  end

  def google
    GOOGLE_URL + query_builder
  end

  def amazon
    AMAZON_URL + query_builder
  end

  def query_builder
    # CHANGE NEXT LINE LOGIC
    @query
  end

  def validate_name
    return if VALID_WEBSITES.include? @name

    raise StandardError, 'invalid website'
  end

  def validate_query
    return if @query.is_a? String

    raise StandardError, 'invalid query'
  end
end
