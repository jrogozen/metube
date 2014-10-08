class Drop < ActiveRecord::Migration
  def change
    drop_table :playlistVideos
  end
end
