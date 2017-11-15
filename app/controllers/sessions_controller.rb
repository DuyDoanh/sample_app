class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      check_remember user
    else
      flash_create_error
    end
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
