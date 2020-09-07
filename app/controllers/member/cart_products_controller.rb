class Member::CartProductsController < ApplicationController

  def index
    @cart_products = CartProduct.all
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.member_id = current_member.id
    if  current_member.cart_products.find_by(product_id: params[:cart_product][:product_id]).present?
        cart_product = current_member.cart_products.find_by(product_id: params[:cart_product][:product_id])
        cart_product.update(quantity: cart_product.quantity.to_i + @cart_product.quantity.to_i)
        flash[:notice] = "Item was successfully added to cart."
        redirect_to member_cart_products_path
    else
        @cart_product.save
        flash[:notice] = "New Item was successfully added to cart."
        redirect_to member_cart_products_path
    end
  end

  def update

  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    cart_product.destroy
    redirect_to member_cart_products_path
  end

  def destroy_all
    CartProduct.destroy_all
    redirect_to member_products_path
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:quantity, :product_id)
  end
end
