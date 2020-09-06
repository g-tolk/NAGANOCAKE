class Member::OrdersController < ApplicationController
  def new
  end

  def complete
  end

  def index
  end

  def show
  	@cart_products = CartProduct.all
  end
end
