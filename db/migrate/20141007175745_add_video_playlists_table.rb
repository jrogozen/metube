class AddVideoPlaylistsTable < ActiveRecord::Migration
  def change

    create_table :videoplaylists do |t|
      t.belongs_to :video
      t.belongs_to :playlist
      t.timestamps
    end

  end
end
