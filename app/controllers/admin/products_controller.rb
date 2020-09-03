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
  end

  def update

  end

  private

  def product_params
  	params.require(:product).permit(:name, :introduction, :genre_id, :non_taxed_price, :image_id, :sale_status)
end
