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
t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity", null: false
    t.integer "non_taxed_price", null: false
    t.integer "product_status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false