class Member::OrdersController < ApplicationController

  def index#注文履歴一覧
    @orders = current_member.orders
  end

  def show#注文商品詳細画面
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
      if Address.find_by(address: @order.address).nil?
        @address = Address.new
        @address.postal_code = @order.postal_code
        @address.address = @order.send_to_address
        @address.addressee = @order.addressee
        @address.member_id = current_member.id
        @address.save
      end

      # cart_itemsの内容をorder_itemsに新規登録
      current_member.cart_products.each do |cart_product|
        order_product = @order.order_products.build
        order_product.order_id = @order.id
        order_product.product_id = cart_product.product_id
        order_product.quantity = cart_product.quantity
        order_product.order_price = cart_product.product.price
        order_product.save
        cart_product.destroy #order_itemに情報を移したらcart_itemは消去
      end
      render 'complete'
    else
      redirect_to root_path
　　　flash[:danger] = 'カートが空です。'
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
    params.require(:order).permit(:member_id, :postage, :payment_amount, :payment_method, :order_status, :receiver, :postal_code, :address)
  end
end

