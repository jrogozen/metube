class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params["id"])
    @videos = Video.all
    @comments = @video.comments
    @comment = Comment.new
  end

  def new
    @video = Video.new
  end

  def create
    @video = current_user.videos.new(video_params)

    if @video.save
      redirect_to @video
    else
      render :new
    end
  end

  def edit
    @user_options = User.all.map{|u| [u.username, u.id]}
    @video = Video.find(params["id"])
  end

  def update
    @video = Video.find(params["id"])
    @video.update(video_params)

    if @video.save
      redirect_to @video
    else
      render :edit
    end
  end

  def destroy
    @video = Video.find(params["id"])
    @video.destroy

    redirect_to :action => 'index'
  end

  def add_to_playlist
    @video = Video.find(params[:id])
    @playlist = Playlist.find(params[:vid][:playlist_id])
    @video.playlists << @playlist

    redirect_to :action => "show"
  end

  def add_to_favorites
    @video = Video.find(params["video_id"])
    @user = User.find(params["user_id"])
    
    @video.favorites.create(:user => @user)

    redirect_to :action => 'index'
  end

  private
  def video_params
    params.require(:video).permit(:title, :url, :user_id, :description)
  end

end
