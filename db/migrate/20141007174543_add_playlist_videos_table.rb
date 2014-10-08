class AddPlaylistVideosTable < ActiveRecord::Migration
  def change
    create_table :playlistVideos do |t|
      t.belongs_to :video
      t.belongs_to :playlist
      t.timestamps
    end
  end
end
