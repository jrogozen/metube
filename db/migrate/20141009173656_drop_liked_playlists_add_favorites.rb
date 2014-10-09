class DropLikedPlaylistsAddFavorites < ActiveRecord::Migration
  def change
    drop_table :liked_playlists

    create_table :favorites do |table|
      table.references :user
      table.integer :favoritable_id
      table.string  :favoritable_type
    end
  end
end
