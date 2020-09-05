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
  	@product = Product.new(
    name: product_params[:name],
    introduction: product_params[:introduction],
    genre_id: product_params[:genre_id],
    non_taxed_price: product_params[:non_taxed_price],
    image_id: product_params[:image],
    sale_status: product_params[:sale_status])
    binding.pry
    if @product.save
      redirect_to admin_products_path
    else
      render ''
    end
  end

  def update

  end

  private

  def product_params
  	params.require(:product).permit(:name, :introduction, :genre_id, :non_taxed_price, :image, :sale_status)
  end
end
