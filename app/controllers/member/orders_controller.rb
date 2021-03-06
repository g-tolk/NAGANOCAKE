class Member::OrdersController < ApplicationController
before_action :authenticate_member!

  def index#注文履歴一覧
    @orders = current_member.orders
    @cart_products = current_member.cart_products
  end

  def show#注文商品詳細画面
    @order = Order.find(params[:id])
    @cart_products = @order.order_products
  end

  def new
  	@order = Order.new
  end

  def complete
    #thank you viewだけ
  end

  def create
    if current_member.cart_products.exists?
      @order = Order.new(order_params)
      @order.member_id = current_member.id

      # 住所のラジオボタン選択に応じて引数を調整
    @add = params[:order][:add].to_i
    case @add
      when 1
        @order.postal_code = current_member.postal_code
        @order.address = current_member.address
        @order.receiver = current_member.family_name + current_member.first_name
      when 2
        @sta = params[:order][:shipping_address].to_i
        @send_to_address = ShippingAddress.find(@sta)
        @order.postal_code = @send_to_address.postal_code
        @order.address = @send_to_address.address
        @order.receiver = @send_to_address.name
      when 3
        @order.postal_code = params[:order][:new_add][:postal_code]
        @order.address = params[:order][:new_add][:address]
        @order.receiver = params[:order][:new_add][:name]
      end

      @order.save

      # send_to_addressで住所モデル検索、該当データなければ新規作成
      if ShippingAddress.find_by(address: @order.address).nil?
        @address = ShippingAddress.new
        @address.postal_code = @order.postal_code
        @address.address = @order.address
        @address.name = @order.receiver
        @address.member_id = current_member.id
        @address.save
      end

      # cart_itemsの内容をorder_itemsに新規登録
      current_member.cart_products.each do |cart_product|
        order_product = @order.order_products.new
        order_product.product_id = cart_product.product_id
        order_product.quantity = cart_product.quantity
        order_product.non_taxed_price = cart_product.product.non_taxed_price
        order_product.save
        cart_product.destroy #order_itemに情報を移したらcart_itemは消去
      end
      render 'complete'
    else
      flash[:danger] = 'カートが空です。'
      redirect_to member_products_path
    end
  end

  def confirm
    @order = Order.new(order_params)
    # 住所のラジオボタン選択に応じて引数を調整
    @add = params[:order][:add].to_i
    case @add
      when 1
        @order.postal_code = current_member.postal_code
        @order.address = current_member.address
        @order.receiver = current_member.family_name + current_member.first_name
      when 2
        @sta = params[:order][:shipping_address].to_i
        @send_to_address = ShippingAddress.find(@sta)
        @order.postal_code = @send_to_address.postal_code
        @order.address = @send_to_address.address
        @order.receiver = @send_to_address.name
      when 3
        @order.postal_code = params[:order][:new_add][:postal_code]
        @order.address = params[:order][:new_add][:address]
        @order.receiver = params[:order][:new_add][:name]
    end

    @cart_products = current_member.cart_products
  end

  private

  def order_params
    params.require(:order).permit(:member_id, :postage, :payment_amount, :payment_method, :order_status, :receiver, :postal_code, :address,
    order_product_attributes: [:order_id, :product_id, :quantity, :non_taxed_price, :product_status])
  end
end

