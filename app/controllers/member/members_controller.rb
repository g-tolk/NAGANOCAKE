class Member::MembersController < ApplicationController
  before_action :ensure_correct_member, only: [:edit]

  def show
    @member = current_member
  end

  def unsubscribe
    @member = Member.find(current_member.id)
  end

  def edit
    @member = Member.find(current_member.id)
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
    @member = Member.find(current_member.id)
    #現在ログインしているユーザーを@userに格納
    @member.update(is_withdeawal_status: "false")
    #updateで登録情報をfalseに変更
    reset_session
    #sessionIDのresetを行う
    redirect_to root_path
    #指定されたrootへのpath
  end

  private

  def member_params
    params.require(:member).permit(:is_withdeawal_status,:family_name, :first_name, :kana_family_name, :kana_first_name, :postal_code, :address, :telephone_number)
  end

  def ensure_correct_member
    @member = Member.find(params[:id])
    unless @member == current_member
      redirect_to root_path
    end
  end

end
