require_relative '../lib/website_generator'

class SearchScript
  def initialize
    welcome
    ask_site
    ask_query
    ask_confirmation
    open_browser
  end

  private

  def welcome
    p 'Welcome in our program'
    p 'This amazing tool can search the web for you safely'
    p 'Please tell us which site you choose'
  end

  def ask_confirmation
    p website_url
    p 'Do you confirm the search ? (y/n)'
    confirmation_input = gets.chomp.match?(/[y|Y]/i)
    return if confirmation_input

    error(message: 'You did not confirm search')
  end

  def open_browser
    website_generator.open
  end

  def website_url
    website_generator.url
  end

  def website_generator
    @website_generator ||= WebsiteGenerator.new(ask_site, ask_query)
  end

  def ask_site
    p 'Which site do you want to search ? (youtube, github, google, amazon)'
    @site_input = gets.chomp

    validate_site_input(@site_input)
  end

  def ask_query
    p 'What do you want to search ?'
    @query_input = gets.chomp

    validate_query_input(@query_input)
  end

  def validate_query_input(input)
    return if input.length > 0

    error(message: "Invalid input, please enter a query")
  end

  def validate_site_input(input)
    return if input == 'youtube' || input == 'github' || input == 'google' || input == 'amazon'

    error(message: "Invalid input, please enter a site name listed above")
  end

  def error(message: '')
    raise StandardError, "Oups, something happened: #{message}"
  end
end

SearchScript.new
