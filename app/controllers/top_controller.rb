class TopController < ApplicationController
  
  require "logger"
  
  def index
    logger.progname = "ctrl/top";logger.info("#index起動")
    @articles = Article.open.readable_user(current_user)
      .order(released_at: :desc).limit(5)
  end
  
  def about
    logger.progname = "ctrl/top";logger.info("#about起動")
  end
end
