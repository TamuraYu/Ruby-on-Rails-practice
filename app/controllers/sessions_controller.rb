class SessionsController < ApplicationController
  
  require "logger"
  
  def create
    logger.progname = "ctrl/session";logger.info("#create起動")
    user = User.authenticate(params[:user_name], params[:password])
    if user
      logger.info("#ログイン成功")
      session[:user_id] = user.id
    else
      logger.warn("#名前とパスワードが一致しません")
      flash.alert = "名前とパスワードが一致しません"
    end
    redirect_to :root
  end

  def destroy
    logger.progname = "ctrl/session";logger.info("#destroy起動")
    session.delete(:user_id)
    redirect_to :root
  end
end
