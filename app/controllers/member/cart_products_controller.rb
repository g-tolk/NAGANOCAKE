class Member::CartProductsController < ApplicationController

  def index
    @cart_product = CartProduct.find_by(id: params[:id], product_id: params[:product_id])
    @cart_products = CartProduct.all
  end

  def create
    @product = Product.find(params[:product_id])
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.product_id = product.id
    @cart_product.user_id = current_user.id
    @cart_product.save
    redirect_to = member_cart_products_path(@cart_product)
 
  end

  def update

  end

  def destroy
  end

  def destroy_all
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:member_id, :product_id, :quantity)
  end
end
