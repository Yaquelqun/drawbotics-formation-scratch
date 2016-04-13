class UsersController < ApplicationController
  include Users
  before_action :authenticate_user!
  def new
      @user = User.new
    end

  def show
    @user = current_user
  end

  def create
    @user=User.create(user_params)
    redirect_to user_path(@user)
  end

  def index
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      fail!
    end
  end

  def destroy
    User.find(params[:user_id]).destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :type)
  end
end
