class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        login_user user
      else
        login_user_error
      end
    else
      login_user_invalid
    end
  end

  def login_user user
    log_in user
    params[:session][:remember_me] == Settings.sessions_controller.bit ? remember(user) : forget(user)
    redirect_back_or user
  end

  def login_user_error
    message = t "controllers.sessions_controller.check_email_activation"
    flash[:warning] = message
    redirect_to root_url
  end

  def login_user_invalid
    flash.now[:danger] = t "controllers.sessions_controller.danger_invalid"
    render :new
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def check_remember user
    log_in user
    params[:session][:remember_me] == Settings.sessions_controller.bit ? remember(user) : forget(user)
    redirect_back_or user
  end

  def flash_create_error
    flash.now[:danger] = t "controllers.sessions_controller.danger_invalid"
    render :new
  end
end
