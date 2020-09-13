class Admin::ProductsController < ApplicationController
before_action :authenticate_admin!
before_action :ensure_correct_admin

  def new
    @product = Product.new
  end

  def index
    @products =Product.all
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end


  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product.id)
    else
      @products =Product.all
      render 'index'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product.id)
    else
      render "edit"
    end
  end

  private

  def product_params
  	params.require(:product).permit(:name, :introduction, :genre_id, :non_taxed_price, :image, :sale_status)
  end

  def ensure_correct_admin
    @admin = Admin.find(params[:id])
    unless @admin == current_admin
      redirect_to root_path
    end
  end
end
