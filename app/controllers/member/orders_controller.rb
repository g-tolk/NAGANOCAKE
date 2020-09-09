class Member::OrdersController < ApplicationController

  def index#注文履歴一覧
    @orders = current_member.orders
  end

  def show#注文商品詳細画面
  end

  def new
  	@order_new = Order.new
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
          @order.postal_code = @member.postal_code
          @order.address = @member.address
          #@order.addressee = family_name(@member)
        when 2
          @order.postal_code = params[:order][:postal_code]
          #@order.send_to_address = params[:order][:send_to_address]
          @order.address = params[:order][:address]
        when 3
          @order.postal_code = params[:order][:postal_code]
          #@order.send_to_address = params[:order][:send_to_address]
          @order.address = params[:order][:address]
      end
      @order.save

      # send_to_addressで住所モデル検索、該当データなければ新規作成
      if Address.find_by(address: @order.address).nil?
        @address = Address.new
        @address.postal_code = @order.postal_code
        #@address.address = @order.send_to_address
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
      render :complete
    else
      redirect_to root_path
　　　flash[:danger] = 'カートが空です。'
    end
  end

  def confirm
    @order_new = Order.new
    @cart_products = current_mmeber.cart_products
    @order.payment_method = params[:order][:payment_method]
    # 住所のラジオボタン選択に応じて引数を調整
    @add = params[:order][:add].to_i
    case @add
      when 1
        @order.post_code = @member.post_code
        #@order.send_to_address = @customer.address
        @order.addressee = @member.family_name + @member.first_name
      when 2
        @sta = params[:order][:send_to_address].to_i
        @send_to_address = Address.find(@sta)
        @order.post_code = @send_to_address.post_code
        @order.send_to_address = @send_to_address.address
        @order.addressee = @send_to_address.addressee
      when 3
        @order.post_code = params[:order][:new_add][:post_code]
        @order.send_to_address = params[:order][:new_add][:address]
        @order.addressee = params[:order][:new_add][:addressee]
    end
  end

  private
  def order_params
    params.require(:order).permit(:member_id, :postage, :payment_amount, :payment_method, :order_status, :receiver, :postal_code, :address,
      order_items_attributes: [:order_id, :product_id, :quantity, :order_price, :make_status]
      )
  end

end

