class AddPlaylist < ActiveRecord::Migration
  def change


    create_table :playlists do |t|
      t.string :name
      t.belongs_to :video
      t.belongs_to :user
      t.timestamps
    end


  end
end
