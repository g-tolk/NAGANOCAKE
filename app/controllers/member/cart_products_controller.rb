class Member::CartProductsController < ApplicationController

  def index
  	@product = Product.find(params[:id])
    @cartproduct = cartproduct.new
  end

  def create
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

end
