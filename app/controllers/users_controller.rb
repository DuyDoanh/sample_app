class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = I18n.t "announce1"
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @use = User.new user_params
    if @user.save
      flash[:success] = I18n.t "announce2"
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
