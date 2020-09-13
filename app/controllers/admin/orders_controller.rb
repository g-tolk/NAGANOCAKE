class Admin::OrdersController < ApplicationController
before_action :authenticate_admin!
before_action :ensure_correct_admin

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
     order = Order.find(params[:id])
     order.update(order_params)
    if params[:order][:order_status] == "入金確認"
    order.order_products.update_all(product_status: 1)
    end
    redirect_to admin_order_path(order)
  end

  private

  def order_params
  params.require(:order).permit(:order_status)
  end

  def ensure_correct_admin
    @admin = Admin.find(params[:id])
    unless @admin == current_admin
      redirect_to root_path
    end
  end
end