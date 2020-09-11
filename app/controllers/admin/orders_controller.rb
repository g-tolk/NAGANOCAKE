class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
     @order = Order.find(params[:id])
    if @order.update(order_params)&& (params[:order_status] == "0")
      redirect_to root_path
       OrderProduct.product_status = 1
       OrderProduct.update
      #redirect_to admin_order_path(@order)
    elsif
      @order.update(order_params) && (enum product_status == 2)
      enum order_status = 2.to_s.update
      redirect_to admin_order_path(@order)
    elsif
      @order.update(order_params) && (enum product_status == 3)
      enum order_status = 3.to_s.update
      redirect_to admin_order_path(@order)
    end
    redirect_to admin_order_path(@order)
  end

  private
  def order_params
  params.require(:order).permit(order_status: params[:order_status])
  end
end
#params[:address][:prefecture].to_i