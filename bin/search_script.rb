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
    p 'Do you confirm the search ?'
    # TO COMPLETE

    # DECLARE VARIABLE BEFORE SO CONDITION WORKS
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
    # TO COMPLETE
    #

    # DECLARE VARIABLE BEFORE SO CONDITION WORKS
    validate_site_input(site_input)
  end

  def ask_query
    # TO COMPLETE
    #

    # DECLARE VARIABLE BEFORE SO CONDITION WORKS
    validate_query_input(query_input)
  end

  def validate_query_input(input)
    # CHANGE NEXT LINE CONDITION (ex: length max / min)
    return if true

    # CHANGE NEXT LINE MESSAGE TO GIVE MORE INFORMATION ABOUT WRONG INPUT
    error(message: "quel méchant query input")
  end

  def validate_site_input(input)
    # CHANGE NEXT LINE CONDITION (ex: uniq word, length max min)
    return if true

    # CHANGE NEXT LINE MESSAGE TO GIVE MORE INFORMATION ABOUT WRONG INPUT
    error(message: "quel méchant site input")
  end

  def error(message: '')
    raise StandardError, "Oups, something happened: #{message}"
  end
end

SearchScript.new
