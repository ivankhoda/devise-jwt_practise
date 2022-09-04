class UsersController < ApplicationController
  before_action :authenticate_user!, except: [create]
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors
    end
  end

  def index; end

  def show; end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'User and oversight updated'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong, please try again'
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = 'The user account has been deleted.'
      redirect_to root_path
    else
      flash.now[:error] = 'Sorry, user record was not changed.'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
