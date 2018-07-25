class SearchController < ApplicationController
  def index
    @presenter = SearchPresenter.new(params[:word])
  end
end
