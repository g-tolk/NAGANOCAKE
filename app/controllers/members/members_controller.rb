class Members::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
  end

  def unsubscribe
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member.update(member_params)
  end

  def withdraw

  end

  private

  def member_params
    params.require(:member).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :postal_code, :address, :telephone_number)
  end
end
