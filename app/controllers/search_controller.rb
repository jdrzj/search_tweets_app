class SearchController < ApplicationController
  def index
    @result = SearchService.new(search_params).call
  end

  private

  def search_params
    params.permit(:q)
  end
end
