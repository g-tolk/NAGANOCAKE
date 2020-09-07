class Member::CartProductsController < ApplicationController

  def index
  	@product = Product.find(params[:id])
    @cartproduct = cartproduct.new
  end

  def creates

  end

  def update
  end

  def destroy
  end

  def destroy_all
  end


  private

  def cart_params
    params.require(:cart_products).permit(:member_id, :product_id, :quantity)
  end
end
