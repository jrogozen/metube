class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end

  def show
    @playlist = Playlist.find(params["id"])
    @videos = @playlist.videos
  end

  def new
    @user_options = User.all.map{|u| [u.username, u.id]}
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)

    if @playlist.save
      redirect_to @playlist
    else
      render :new
    end
  end

  def edit
    @user_options = User.all.map{|u| [u.username, u.id]}
    @playlist = Playlist.find(params["id"])
  end

  def update
    @playlist = Playlist.find(params["id"])
    @playlist.update(playlist_params)

    if @playlist.save
      redirect_to @playlist
    else
      render :edit
    end
  end

  def destroy
    @playlist = Playlist.find(params["id"])
    @playlist.destroy

    redirect_to :action => 'index'
  end

  private
  def playlist_params
    params.require(:playlist).permit(:name, :user_id)
  end

end
