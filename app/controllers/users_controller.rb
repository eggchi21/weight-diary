class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user=User.find(params[:id])
    @diaries=Diary.where(user_id:params[:id]).order('created_at ASC')
    @ids=@diaries.map(&:id)
    @weights=@diaries.map(&:weight)
    @dates=@diaries.map{|diary| diary.created_at.strftime('%Y/%m/%d') }
  end

end
