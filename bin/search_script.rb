# frozen_string_literal: true

require_relative '../lib/website_generator'

# SearchScript class
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
    puts  '╔════════════════════════════════════════════════════════════╗'
    puts  '║                      Welcome in our program                ║'
    puts  '║      This amazing tool can search the web for you safely   ║'
    puts  '║              Please tell us which site you choose          ║'
    puts  '╚════════════════════════════════════════════════════════════╝'
  end

  def ask_confirmation
    puts ''
    puts "Searching for #{@query_input} on #{@site_input}..."
    puts "(#{website_url})"
    puts ''
    puts 'Do you confirm the search ?'
    print 'y/n > '
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
    @ask_site ||=
      begin
        puts ''
        p 'Which site do you want to search ? (youtube, github, google, amazon)'
        print '> '
        site_input = gets.chomp

        validate_site_input(site_input)
      end
  end

  def ask_query
    @ask_query ||=
      begin
        puts ''
        p 'What do you want to search ?'
        print '> '
        query_input = gets.chomp

        validate_query_input(query_input)
      end
  end

  def validate_query_input(input)
    return input if input.length.positive?

    error(message: 'Invalid input, please enter a query')
  end

  def validate_site_input(input)
    return input if %w[youtube github google amazon].include?(input)

    error(message: 'Invalid input, please enter a site name listed above')
  end

  def error(message: '')
    raise StandardError, "Oups, something happened: #{message}"
  end
end

SearchScript.new
