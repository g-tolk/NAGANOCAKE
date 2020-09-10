class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])

  end

  def update
     @order = Order.find(params[:id])
    if @order.update(order_params) && (enum order_product_status == 2)
      enum order_status = 2.to_s.update
      redirect_to root_path
    else
      render "edit"
    end
  end
end
