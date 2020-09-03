class Member::MembersController < ApplicationController
  def show
    @member = current_member
    @members = Member.all
  end

  def unsubscribe
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to member_members_path
    else
      render :edit
    end
  end


  def withdraw

  end

  private

  def member_params
    params.require(:member).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :postal_code, :address, :telephone_number)
  end
end
