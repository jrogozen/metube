class CreateVideoPlaylists < ActiveRecord::Migration
  def change
    create_table :video_playlists do |t|

      t.timestamps
    end
  end
end
