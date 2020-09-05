class Member::ShippingAddressesController < ApplicationController
  def index
  	@address = ShippingAddress.new
  	@addresses = ShippingAddress.all
  end


  def create
  	@address = ShippingAddress.new(address_params)
  	@address.member_id = current_member.id
  	if @address.save
  	else
  	@addresses = ShippingAddress.all
  	render :index
    end
  end

  def edit
  end

  private
  def address_params
  	paramas.require(:shipping_address).permit(:member_id, :name, :postal_code, :address)
  end

end