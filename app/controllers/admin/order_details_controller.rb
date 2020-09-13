class Admin::OrderDetailsController < ApplicationController
before_action :authenticate_admin!
before_action :ensure_correct_admin

  def update
     order_product = OrderProduct.find(params[:id])
     order_product.update(order_product_params)
    if params[:order_product][:product_status] == "製作中"
    	order_product.order.update(order_status: 2)
    end

    total =0

    order_product.order.order_products.each do |order_product|
    	 if order_product.product_status == "製作完了"
    	 	total += 1
    	 end
    end
    if order_product.order.order_products.count == total
       order_product.order.update(order_status: 3)
    end
    redirect_to admin_order_path(order_product.order.id)
    #redirect_to admin_order_path(order)
  end

  private

  def order_product_params
  params.require(:order_product).permit(:product_status)
  end

  def ensure_correct_admin
    @admin = Admin.find(params[:id])
    unless @admin == current_admin
      redirect_to root_path
    end
  end

end

