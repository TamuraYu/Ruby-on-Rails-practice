class AccountsController < ApplicationController

  before_action :login_required
  require "logger"
  
  def show
    logger.progname = "ctrl/accounts";logger.info("#show起動")
    @user = current_user
  end

  def edit
    logger.progname = "ctrl/accounts";logger.info("#edit起動")
    @user = current_user
  end

  def update
    logger.progname = "ctrl/accounts";logger.info("#update起動")
    @user = current_user
    @user.assign_attributes(account_params)
    if @user.save
      logger.info("#ユーザデータのアップデート成功")
      redirect_to :account, notice: "Update account"
    else
      logger.error("ユーザデータのアップデート失敗")
      render "edit"
    end
  end

  private
  def account_params
    params.require(:account).permit(:id, :user_name, :gender, :admin, :birthday, :mail, :counts, :tekigou, :password, :password_confirmation)
  end
end
