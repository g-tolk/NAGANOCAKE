class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def index
    @products =Product.all
  end

  def edit
  end

  def show
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
    else
      render 'index'
    end
  end

  def update

  end

  private

  def product_params
  	params.require(:product).permit(:name, :introduction, :genre_id, :non_taxed_price, :image, :sale_status)
  end
end
