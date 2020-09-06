class Admin::OrdersController < ApplicationController
  def index
    @order_product = OrderProduct.all
  end

  def show

  end

  def update
     @order = Order.find(params[:id])
    if @order.update(order_params) && (enum order_product_status == 2)
      enum order_status = 2.to_s.update
      redirect_to book_path(@book)
    else
      render "edit"
    end
  end
end
