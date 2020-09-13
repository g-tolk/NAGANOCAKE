class Member::ShippingAddressesController < ApplicationController
before_action :authenticate_member!

  def index
  	@address = ShippingAddress.new
    @member = @address.member
  	@addresses = ShippingAddress.all
  end


  def create
  	@address = ShippingAddress.new(address_params)
    @address.member_id = current_member.id
  	if @address.save
      redirect_to member_shipping_addresses_path
  	else
    @addresses = ShippingAddress.all
  	render :index
    end
  end

  def edit
    @address = ShippingAddress.find(params[:id])
  end

  def update
    @address = ShippingAddress.find(params[:id])
    if @address.update(address_params)
      redirect_to member_shipping_addresses_path
    else
      render :edit
  end
end

def destroy
  address = ShippingAddress.find(params[:id])
    address.destroy
    redirect_to member_shipping_addresses_path
end

  private
  def address_params
  	params.require(:shipping_address).permit(:member_id,:name, :postal_code, :address)
  end

end