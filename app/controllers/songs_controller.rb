class SongsController < ApplicationController
  
    before_action :login_required
    require "logger"

  # 曲一覧
  def index
    logger.progname = "ctrl/songs";logger.info("#index起動")
    @songs = Song.order("id")
  end
  
  # 記事詳細
  def show
    logger.progname = "ctrl/songs";logger.info("#show起動")
    @song = Song.find(params[:id])
    category = ['静かな', 'ゆっくりな', '人工的な', '透き通った', '単調な', '明るい']
    data_sd = [@song.sizuka, @song.yukkuri, @song.zinkou, @song.sukitoru, @song.tantyo, @song.akarui]

    @song_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:chart][:inverted] = true
      f.series(name: @song.song_title, data: data_sd, animation: false)
      f.title(text: @song.song_title + 'の感性評価')
      f.xAxis(categories: category)
    end
  end
  
  # 新規登録
  def new
    logger.progname = "ctrl/songs";logger.info("#new起動")
    if admin_user
      logger.info("#新規登録(new)")
      @song = Song.new
    end
  end
  
  # 編集
  def edit
    logger.progname = "ctrl/songs";logger.info("#edit起動")
    if admin_user == 1
      logger.info("#Adminです")
      @song = Song.find(params[:id])
    else
      @song = Song.find(params[:id])
      redirect_to @song, notice: "Admin以外は編集できません"
    end
  end
  
  def create
    logger.progname = "ctrl/songs";logger.info("#create起動")
    if admin_user
      logger.info("#新規登録(create)")
      @song = Song.new(song_params)
      if @song.save
        logger.info("#曲の追加完了")
        redirect_to @song, notice: "Add Song!"
      else
      logger.info("#曲の追加失敗")
      render "new"
      end
    end
  end
  
  def update
    logger.progname = "ctrl/songs";logger.info("#update起動")
    @song = Song.find(params[:id])
    processing()
    @song.assign_attributes(song_params_SD)
    if @song.save
      logger.info("#曲データのアップデート完了")
        redirect_to :exit
    else
      logger.info("#曲データのアップデート失敗")
        redirect_to "exit"
    end
  end
  
  def destroy
    logger.progname = "ctrl/songs";logger.info("#destroy起動")
    if admin_user == 1
      logger.info("#Adminでした")
      @song = Song.find(params[:id])
      @song.destroy
      logger.info("#曲データの削除成功")
      redirect_to :songs, notice: "Delete the Song"
    else
      @song = Song.find(params[:id])
      redirect_to @song, notice: "Admin以外は編集できません"
    end
  end

  def treasure
    logger.progname = "ctrl/songs";logger.error("#treasure起動 : このメソッドはいつ使うの?")
    p song.comparison()
    end

  private
  def song_params
    params.require(:song).permit(:song_url, :song_title, :composer, :singer, :created_at)
  end

  def song_params_SD
    params.require(:song).permit(:id, :sizuka, :yukkuri, :zinkou, :sukitoru, :tantyo, :akarui, :atarashi, :sodai, :juko, :daitan, :otituita, :dainamikku, :counts, :tekigou)
  end

  def processing
    logger.progname = "ctrl/songs";logger.info("#process起動")
    @song = Song.find(params[:id])
    logger.info("#Sizuka(変更前) = " + @song.sizuka.to_s)
    logger.info("#Sizuka(入力値) = " + params[:song][:sizuka].to_s)
    @song.sizuka = @song.sizuka + params[:song][:sizuka].to_i - 2.0
    logger.info("#Sizuka(変更後) = " + @song.sizuka.to_s)
    if(@song.sizuka < 0)
      @song.sizuka = 0
    elsif(@song.sizuka > 9)
      @song.sizuka = 9
    end
    logger.info("#Sizuka(上限下限修正) = " + @song.sizuka.to_s)
  end

end
