class RemovePlaylistReferences < ActiveRecord::Migration
  def change
    remove_reference :playlists, :video
    remove_reference :playlists, :user
  end
end
