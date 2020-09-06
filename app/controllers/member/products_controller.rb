class Member::ProductsController < ApplicationController
  def top
  end

  def about
  end

  def index
  @search_product = Product.where(genre_id: params[:genre_id])
  @genres = Genre.all
  @products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end


end
