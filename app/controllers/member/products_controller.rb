class Member::ProductsController < ApplicationController
  def top
  end

  def about
  end

  def index
    @products = Product.all
  end


  def show
  	@product = Product.find(params[:id])
    @product_new = Product.new
  end
end
