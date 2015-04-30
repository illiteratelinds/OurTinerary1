class SearchController < ApplicationController

  def index
    @results = Search.for(params[:keyword])
  end
end
