class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def new
  end

  def show
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to @user, notice: '用户新建成功'
    else
      flash[:alert] = '用户创建失败'
      redirect_to new_user_path
    end
  end

  private

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:name, :birthday)
  end
end
