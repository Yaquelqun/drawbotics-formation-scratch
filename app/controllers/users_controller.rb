class UsersController < ApplicationController

  def new
      @user = User.new
    end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user=User.create(user_params)
    redirect_to user_path(@user)
  end

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:user_id]).delete
    redirect_to users_path
  end
  
  private

  def user_params
    params.require(:user).permit(:username)
  end
end
