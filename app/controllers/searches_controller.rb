class SearchesController < ApplicationController

    before_action :login_required
    require "logger"

    # 曲一覧
    def index
        logger.progname = "ctrl/searches";logger.info("#index起動")
        @Searches = Searches.order("id")
    end

    def show
        logger.progname = "ctrl/searches";logger.info("#show起動")
    end

    def create
        logger.progname = "ctrl/searches";logger.info("#create起動")
    end

    def treasure
        logger.progname = "ctrl/searches";logger.info("#treasure起動")
        @treasure = comparison
        @url = @treasure.song_url
        @song = Song.find(@treasure.id)
        @song.counts += 1
        @song.save
        logger.info("#カウントを変更 : 1UP")
        logger.info("#Recentデータ(最近聞いた曲)のデータ変更......")
        @user_data.recent5 = @user_data.recent4
        @user_data.recent4 = @user_data.recent3
        @user_data.recent3 = @user_data.recent2
        @user_data.recent2 = @user_data.recent1
        @user_data.recent1 = @treasure.id
        @user_data.save
        logger.info("#Recentデータ変更完了")
    end

    def exit
        logger.progname = "ctrl/searches";logger.info("#exit起動")
    end

    def comparison
        logger.progname = "ctrl/searches";logger.info("#comparison起動")
        logger.info("#UserDB読み込み......")
        @user_data = User.find(current_user.id)
        logger.info("#読み込んだUserの情報\n")
        print("ID : #{@user_data.id}")
        print("\nName : #{@user_data.user_name}")
        print("\nAdmin : ")
        @user_data.admin == 1 ? print("true") : print("false")
        print("\nGender : ")
        @user_data.gender == 0 ? print("male") : print("female")
        print("\nCounts : #{@user_data.counts}")
        print("\nMatch Rate : #{@user_data.tekigou}")
        print("\n\n")
        logger.info("#UserDB読み込み完了")

        logger.info("#SongDB読み込み......")
        @songs = Song.order("id")
        logger.info("#SongDB読み込み完了")
        logger.info("#曲一覧\n")
        @songs.each do |song|
            p song.song_title
        end
        print("\n")

        difference = 0
        difference_min = 120
        return_id = 0

        @songs.each do |song|
            difference += (@user_data.sizuka - song.sizuka).abs
            difference += (@user_data.yukkuri - song.yukkuri).abs
            difference += (@user_data.zinkou - song.zinkou).abs
            difference += (@user_data.sukitoru - song.sukitoru).abs
            difference += (@user_data.tantyo - song.tantyo).abs
            difference += (@user_data.akarui - song.akarui).abs
            difference += (@user_data.atarashi - song.atarashi).abs
            difference += (@user_data.sodai - song.sodai).abs
            difference += (@user_data.juko - song.juko).abs
            difference += (@user_data.daitan - song.daitan).abs
            difference += (@user_data.otituita - song.otituita).abs
            difference += (@user_data.dainamikku - song.dainamikku).abs
            if difference_min > difference
                difference_min = difference
                return_id = song.id
            end
            difference = 0
        end
        @song_data = Song.find(return_id)
        logger.info("#選ばれたのはこの曲でした")
        print("\n           Title : " + @song_data.song_title)
        print("\n        composer : " + @song_data.composer)
        print("\n          singer : " + @song_data.singer)
        print("\nユーザ評価との差 : " + difference_min.to_s + "\n\n")

        @song_data.counts += 1
        @return = @song_data
        @user_data.counts += 1
        @user_data.save
        return @return
    end
end