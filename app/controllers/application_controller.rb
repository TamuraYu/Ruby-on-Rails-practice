class ApplicationController < ActionController::Base

  require "logger"
  class Forbidden < StandardError; end

  private
  def current_user
    logger.progname = "ctrl/application";logger.info("currenr_user起動")
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def admin_user
    @user = User.find(session[:user_id]) if session[:user_id]
    logger.progname = "ctrl/application";logger.info("admin_user起動")
    @user.admin if session[:user_id]
  end

  helper_method :current_user
  helper_method :admin_user

  def login_required
    logger.progname = "ctrl/application";logger.info("#login_required起動")
    raise Forbidden unless current_user
  end

  def admin_required
    logger.progname = "ctrl/application";logger.info("#admin_required起動")
    raise Forbidden unless admin_user == 1
  end
end
