class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
     @order = Order.find(params[:id])
    if @order.update(order_params) && (enum order_status == 1)
      enum product_status = 1.to_s.update
    elsif
      @order.update(order_params) && (enum product_status == 2)
      enum order_status = 2.to_s.update
    elsif
      @order.update(order_params) && (enum product_status == 3)
      enum order_status = 3.to_s.update
    end
    redirect_to admin_order_path(@order)
  end

  private
  def order_params
  params.require(:order).permit(:order_id, :product_id, :quantity, :non_taxed_price, :product_status)
  end
end
