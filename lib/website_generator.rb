# frozen_string_literal: true

require 'launchy'

# WebsiteGenerator class
class WebsiteGenerator
  def initialize(name, query)
    @name = name
    validate_name
    @query = query
    validate_query
  end

  def url
    send(@name)
  end

  def open
    Launchy.open send(@name)
  end

  private

  # COMPLETE NEXT LINE
  VALID_WEBSITES = %w[youtube github google amazon].freeze

  # FIX EACH URL
  YOUTUBE_URL = 'https://www.youtube.com/'
  GITHUB_URL = 'https://github.com/'
  GOOGLE_URL = 'https://www.google.com/'
  AMAZON_URL = 'https://www.amazon.fr/'

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

  def prefix
    {
      'youtube' => 'results?search_query=',
      'github' => 'search?q=',
      'google' => 'search?q=',
      'amazon' => 's?k='
    }[@name]
  end

  def query_builder
    prefix + @query.gsub(' ', '+')
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
