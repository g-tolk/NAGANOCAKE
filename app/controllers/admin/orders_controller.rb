class Admin::OrdersController < ApplicationController
  def index
  end

  def update
     @order = Order.find(params[:id])
    if @order.update(order_params) && enum order_product_status == 2
      enum order_status = 2.to_s.update
      redirect_to book_path(@book)
    else
      render "edit"
    end
  end

  end

  end
end
