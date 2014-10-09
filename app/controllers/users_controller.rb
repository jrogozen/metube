class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments
    @playlists = @user.playlists
    @videos = @user.videos

    @fp = @user.favorites.where(:favoritable_type => "Playlist")
    @fv = @user.favorites.where(:favoritable_type => "Video")

    @f_playlists = @fp.map {|x| Playlist.find(x.favoritable_id)}
    @f_videos = @fv.map {|x| Video.find(x.favoritable_id)}
  end

  def avatar
    @avatar = User.find(params[:id]).avatar
    render json: @avatar
  end

end
