class CyclingController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :sign_in]
  before_action :set_activity
  def index
    unless user_signed_in?
      redirect_to :sign_in
    end
  end

  #開始する
  def begin
    course = Course.first
    @activity = Activity.create(course:course, user:current_user)
    session[:activity_id] = @activity.id
    redirect_to "/"
  end

  private
  def set_activity
    @activity = session[:activity_id] && Activity.find(session[:activity_id])
  end
end
