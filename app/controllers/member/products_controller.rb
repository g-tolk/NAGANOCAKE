class Member::ProductsController < ApplicationController


  def top
    @genres = Genre.all
    @products = Product.all
  end

  def about
  end

  def index
    @search_product = Genre.where(genre_id: params[:genre_id])
    @genres = Genre.all
    @products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
    #@product_new.cart_products.build
    @product_new = CartProduct.new
  end




end
