class SearchService
  def initialize(params)
    @params = params
  end

  def call
    if query_search_valid
      TwitterApi::Client.new.search_tweets(search_query)
    end
  end

  private

  def search_query
    @params[:q]
  end

  def query_search_valid
    !search_query.nil? && !search_query.blank?
  end
end
