class Admin::MembersController < ApplicationController

  def index
  	@members = Member.all
  end

  def show
  	@member = Member.find(params[:id])
  end

  def edit
  	@member = Member.find(params[:id])
  end

  def update
  	@member = Member.find(params[:id])
    if @member.update(member_params)
       redirect_to admin_members_path
    else
       render :edit
    end
  end

  def withdraw
    @member = Member.find(params[:id])
    #ユーザーを@userに格納
    @member.update(is_withdeawal_status: false)
    #updateで登録情報をfalseに変更
    reset_session
    #sessionIDのresetを行う
    redirect_to admin_members_path
    #指定されたrootへのpath
  end

  private
  def member_params
    params.require(:member).permit(:is_withdeawal_status,:family_name, :first_name, :kana_family_name, :kana_first_name, :postal_code, :address, :telephone_number)
  end

end
