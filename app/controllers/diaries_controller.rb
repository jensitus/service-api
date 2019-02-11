class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :update, :destroy]

  def index
    @diaries = current_user.diaries.order(created_at: :desc)
    json_response(@diaries)
  end

  def create
    puts diary_params.inspect
    @diary = current_user.diaries.create!(title:diary_params['title'], body: diary_params['body'], user_id: current_user.id)
    json_response(@diary, :created)
  end

  def show
    json_response(@diary)
  end

  def update
    @diary.update(diary_params)
    json_response status: :created
  end

  def destroy
    @diary.destroy
    head :no_content
  end

  private

  def set_diary
    @diary = Diary.find(params[:id])
  end

  def diary_params
    params.permit(:title, :body, :user)
  end

end
