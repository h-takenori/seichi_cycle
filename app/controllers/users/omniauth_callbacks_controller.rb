class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.find_or_create_by(user_params)

    auth = request.env['omniauth.auth']
    @user.name = auth['info']['name']
    @user.nickname = auth['info']['nickname']
    @user.oauth_token = auth['credentials']['token']
    @user.oauth_token_secret = auth['credentials']['secret']
    @user.save!

    if @user.persisted?
      @user.remember_me!
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  private
  def user_params
    request.env["omniauth.auth"].slice(:provider, :uid).to_h
  end
end