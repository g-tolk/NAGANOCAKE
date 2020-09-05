class Member::ShippingAddressesController < ApplicationController

  def index
  	@address = ShippingAddress.new
    @member = @address.member
  	@addresses = ShippingAddress.all
  end


  def create
  	@address = ShippingAddress.new(address_params)
  	if @address.save
      redirect_to member_shipping_addresses(@member.id)
  	else
    @addresses = ShippingAddress.all
  	render :index
    end
  end

  def edit
  end

  private
  def address_params
  	params.require(:shipping_address).permit(:member_id, :name, :postal_code, :address)
  end

end