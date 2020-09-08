class Member::OrdersController < ApplicationController
  def new
  	@order_new = Order.new
    #@member = current_member
  end

  def confirm
  end

  def complete
  end

  def index
  end

  def show
  	@cart_products = CartProduct.all
  end

  def create
   @order = current_member.orders.new(order_params)
   @order.save
   @cart_products = current_user.cart_products.all
     @cart_products.each do |cart_product|
        @order_products = @order.order_products.new
        @order_products.product_id = cart_item.item.id
        @order_products.name = cart_item.item.name
        @order_products.price = cart_item.item.price
        @order_products.quantity = cart_item.quantity
        @order_products.save
     end
  end
end
