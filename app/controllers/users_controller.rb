class UsersController < ApplicationController

  before_action :admin_required
  require "logger"

  def index
    logger.progname = "ctrl/users";logger.info("#index起動")
    @users = User.order("id").paginate(page: params[:page], per_page: 10)
  end
  
  def show
    logger.progname = "ctrl/users";logger.info("#show起動")
    @user = User.find(params[:id])
  end
  
  def new
    logger.progname = "ctrl/users";logger.info("#new起動")
    @user = User.new(birthday: Date.new(1900, 1, 1))
  end
  
  def edit
    logger.progname = "ctrl/users";logger.info("#edit起動")
    @user = User.find(params[:id])
  end
  
  # createとupdateはこれが基本．どのモデルでも同じような記述になる
  def create
    logger.progname = "ctrl/users";logger.info("#create起動")
    @user = User.new(user_params)
    if @user.save
      logger.info("#アカウント作成成功")
      redirect_to @user, notice: "Account registration was successful!"
    else
      logger.error("#アカウント作成失敗")
      render "new"
    end
  end
  
  def update
    logger.progname = "ctrl/users";logger.info("#update起動")
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    if @user.save
      logger.info("#アカウント更新完了")
      redirect_to @user, notice: "Account update was successful!"
    else
      logger.error("アカウント更新失敗")
      render "edit"
    end
  end
  
  def destroy
    logger.progname = "ctrl/users";logger.info("#destroy起動")
    @user = User.find(params[:id])
    @user.destroy
    logger.info("#アカウント削除完了")
    redirect_to :users, notice: "Delete the account"
  end
  
  # 検索
  def search
    logger.progname = "ctrl/users";logger.info("#search起動")
    @users = User.search(params[:q]).paginate(page: params[:page], per_page: 10)
    logger.info("#イマイチどこで使われてるかわからない")
    render "index"
  end

  private
  def user_params
    attrs = [:id, :user_name, :gender, :mail, :birthday, :counts, :tekigou, :password, :password_confirmation]
    attrs << :admin if current_user.admin?
    params.require(:user).permit(attrs)
  end
end
