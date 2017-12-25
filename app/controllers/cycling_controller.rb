class CyclingController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :sign_in]
  skip_before_action :verify_authenticity_token, only: [:begin, :add_coords]
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

  def add_coords
    pass = Pass.create!(activity:@activity, lat:params[:coords][:latitude], lng:params[:coords][:longitude])
    near_checkpoint = pass.find_near_checkpoint
    if near_checkpoint
      pass.checkpoint = near_checkpoint
      pass.save!
    end
    @activity.save!
    render json:{result:"ok"}
  end

  private
  def set_activity
    @activity = session[:activity_id] && Activity.find(session[:activity_id])
  end

  def distance(pos1, pos2)
    # ラジアン単位に変換
    x1 = pos1.lat.to_f * Math::PI / 180
    y1 = pos1.lng.to_f * Math::PI / 180
    x2 = pos2.lat.to_f * Math::PI / 180
    y2 = pos2.lng.to_f * Math::PI / 180

    # 地球の半径 (km)
    radius = 6378.137

    # 差の絶対値
    diff_y = (y1 - y2).abs

    calc1 = Math.cos(x2) * Math.sin(diff_y)
    calc2 = Math.cos(x1) * Math.sin(x2) - Math.sin(x1) * Math.cos(x2) * Math.cos(diff_y)

    # 分子
    numerator = Math.sqrt(calc1 ** 2 + calc2 ** 2)

    # 分母
    denominator = Math.sin(x1) * Math.sin(x2) + Math.cos(x1) * Math.cos(x2) * Math.cos(diff_y)

    # 弧度
    degree = Math.atan2(numerator, denominator)

    # 大円距離 (km)
    degree * radius
  end
end
