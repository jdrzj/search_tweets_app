require 'rails_helper'

describe TwitterApi::Client do
  context '#search_tweets' do
    let(:client) { TwitterApi::Client.new }

    before(:each) do
      stub_request(:get, "https://api.twitter.com/1.1/search/tweets.json").to_return(
        body: ""
      )
    end

    it 'returns array tweets'
    it 'returns array tweets that are hashes'
    it 'returns boolean status'
    it 'returns message'
  end
end
