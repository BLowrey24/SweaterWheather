class Api::V1::BooksController < ApplicationController
  def index
   location = params[:location]
   quantity = params[:quantity].to_i
    render json: BookSearchService.new.get_books(location, quantity)
  end
end