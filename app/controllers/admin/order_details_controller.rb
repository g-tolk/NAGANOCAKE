class Admin::OrderDetailsController < ApplicationController
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
     binding.pry
    if order_product.order.order_products.count == total
       order_product.order.update(order_status: 3)
    end
    redirect_to admin_order_path(order_product)
    #redirect_to admin_order_path(order)
  end

  private

  def order_product_params
  params.require(:order_product).permit(:product_status)
  end
end

