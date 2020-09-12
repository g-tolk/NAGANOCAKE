class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
     @order = Order.find(params[:id])
     @order.update(order_params)
     #@order.update(order_params)
      #&& (params[:order_status] == "0")
      redirect_to root_path
       OrderProduct.product_status = 1
       OrderProduct.update
      #redirect_to admin_order_path(@order)
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    order_params.each do |key,value|
      if integer_string?(value)
         order_params[key]=value.to_i
      end
    end
  end

  #def order_params
  #params.require(:order).permit(:order_status)
  #end
end
#params[:address][:prefecture].to_i