require 'rspec'
require_relative '../../lib/website_generator'

RSpec.describe WebsiteGenerator do
  let(:youtube_generator) { described_class.new('youtube', 'boxe francaise') }
  let(:google_generator) { described_class.new('google', 'boxe francaise') }
  let(:amazon_generator) { described_class.new('amazon', 'boxe francaise') }
  let(:github_generator) { described_class.new('github', 'boxe francaise') }

  context 'shared tests' do
    random_website_name = %w(youtube github amazon google).sample
    random_website = described_class.new(random_website_name, 'boxe francaise')
    it { expect { random_website.url }.not_to raise_error }
    it { expect(random_website.url).to be_a String }
  end

  context 'youtube generator' do
    it { expect(youtube_generator.url).to eq 'https://www.youtube.com/results?search_query=boxe+francaise' }
  end

  context 'google generator' do
    it { expect(google_generator.url).to eq 'https://www.google.com/search?q=boxe+francaise' }
  end

  context 'amazon generator' do
    it { expect(amazon_generator.url).to eq 'https://www.amazon.fr/s?k=boxe+francaise' }
  end

  context 'github generator' do
    it { expect(github_generator.url).to eq 'https://github.com/search?q=boxe+francaise' }
  end

  context 'when wrong input' do
    it { expect { described_class.new('bonjour', 'bonjour') }.to raise_error(StandardError) }
    it { expect { described_class.new('youtube', true) }.to raise_error(StandardError) }
  end
end