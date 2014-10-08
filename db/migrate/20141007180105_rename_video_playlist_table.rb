class RenameVideoPlaylistTable < ActiveRecord::Migration
  def change
     rename_table :videoplaylists, :videoPlaylists
  end
end
