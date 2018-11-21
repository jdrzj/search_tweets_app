module TwitterApi
  class Client
    MAX_TWEETS = 20
    def search_tweets(query)
      search_results = twitter_client.search(query, count: MAX_TWEETS)
      searched_tweets = search_results.to_h[:statuses]
      formatted_results(searched_tweets)
    rescue HTTP::ConnectionError
      formatted_results([], false, "Connection error, please try again later.")
    rescue Twitter::Error::BadRequest
      formatted_results([], false, "Bad Authentication data.")
    rescue Twitter::Error::TooManyRequests
      formatted_results([], false, "Too many requests.")
    rescue
      formatted_results([], false, "Unknown error.")
    end

    private

    def formatted_results(tweets, success=true, message="OK")
      {
        data: tweets,
        success: success,
        message: message
      }
    end

    def twitter_client
      @twitter_client ||= Twitter::REST::Client.new do |config|
        twitter_secrets = Rails.application.credentials[Rails.env.to_sym][:twitter]
        config.consumer_key = twitter_secrets[:api_key]
        config.consumer_secret = twitter_secrets[:api_secret_key]
      end
    end
  end
end
