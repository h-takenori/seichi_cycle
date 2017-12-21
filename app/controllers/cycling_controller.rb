class CyclingController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :sign_in]
  def index
    unless user_signed_in?
      redirect_to :sign_in
    end
  end
end
