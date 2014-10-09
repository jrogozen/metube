class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end

  def show
    @playlist = Playlist.find(params["id"])
    @videos = @playlist.videos
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = current_user.playlists.new(playlist_params)

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

  def add_to_favorites
    @playlist = Playlist.find(params["playlist_id"])
    @user = User.find(params["user_id"])
    
    @playlist.favorites.create(:user => @user)

    redirect_to :action => 'index'
  end

  private
  def playlist_params
    params.require(:playlist).permit(:name)
  end

end
