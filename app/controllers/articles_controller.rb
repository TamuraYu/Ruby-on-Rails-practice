class ArticlesController < ApplicationController

  before_action :login_required, except: [:index, :show]
  require "logger"

  # 記事一覧
  def index
    logger.progname = "ctrl/articles";logger.info("#index起動")
    @articles = Article.readable_user(current_user).order(released_at: :desc)
  end
  
  # 記事詳細
  def show
    logger.progname = "ctrl/articles";logger.info("#show起動")
    @article = Article.readable_user(current_user).find(params[:id])
  end
  
  # 新規登録
  def new
    logger.progname = "ctrl/articles";logger.info("#new起動")
    if current_user
      logger.info("#新規登録(new)")
      @article = Article.new
    end
  end
  
  # 編集
  def edit
    logger.progname = "ctrl/articles";logger.info("#edit起動")
    if admin_user == 1
      logger.info("#Adminです")
      @article = Article.find(params[:id])
    else
      @article = Article.find(params[:id])
      redirect_to @article, notice: "Admin以外は編集できません"
    end
  end
  
  def create
    logger.progname = "ctrl/articles";logger.info("#create起動")
    if current_user
      logger.info("#新規登録(create)")
      @article = Article.new(article_params)
      if @article.save
        logger.info("#記事の追加成功")
        redirect_to @article, notice: "Add Announcement!"
      else
        logger.error("#記事の追加失敗")
        render "new"
      end
    end
  end
  
  def update
    logger.progname = "ctrl/articles";logger.info("#update起動")
    if admin_user == 1
      logger.info("#Adminでした")
      @article = Article.find(params[:id])
      @article.assign_attributes(article_params)
      if @article.save
        logger.info("#記事のアップデート成功")
        redirect_to @article, notice: "Update Announcement!"
      else
        logger.error("#記事のアップデート失敗")
        render "edit"
      end
    end
  end
  
  def destroy
    logger.progname = "ctrl/articles";logger.info("#destroy起動")
    if admin_user == 1
      logger.info("#Adminでした")
      @article = Article.find(params[:id])
      @article.destroy
      logger.info("#記事の削除成功")
      redirect_to :articles, notice: "Delete the Announcement"
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :released_at, :no_expiration, :expired_at, :user_only)
  end
end
