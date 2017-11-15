class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user_activate user
    else
      user_activate_error
    end
  end

  def user_activate user
    user.activate
    log_in user
    flash[:success] = t "controllers.account_activations_controller.account_activated"
    redirect_to user
  end

  def user_activate_error
    flash[:danger] = t "controllers.account_activations_controller.invalid_activation"
    redirect_to root_url
  end
end
