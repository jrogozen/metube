class AddUsertoPlaylist < ActiveRecord::Migration
  def change
    add_reference :playlists, :user
  end
end
