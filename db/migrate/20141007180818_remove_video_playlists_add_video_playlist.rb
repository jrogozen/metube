class RemoveVideoPlaylistsAddVideoPlaylist < ActiveRecord::Migration
  def change
    drop_table :videoPlaylists
    add_reference :video_playlists, :video
    add_reference :video_playlists, :playlist
  end
end
