class DiariesController < ApplicationController
  def index
    @diaries=Diary.all.order('created_at ASC')
    @ids=@diaries.map(&:id)
    @weights=@diaries.map(&:weight)
    @dates=@diaries.map{|diary| diary.created_at.strftime('%Y/%m/%d') }
  end

  def show
    @diary=Diary.find_by(params[:id])
  end

  def new
    @diary=Diary.new
  end

  def create
    Diary.create(diary_params)
    redirect_to root_path
  end

  def edit
    @diary=Diary.find_by(params[:id])
  end

  def update
    diary=Diary.find_by(params[:id])
    if diary.user_id==current_user.id
      diary.update(diary_params)
      redirect_to root_path
    end
  end

  def diary_params
    params.require(:diary).permit(:weight).merge(user_id: current_user.id)
  end
end
