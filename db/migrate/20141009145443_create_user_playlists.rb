class CreateUserPlaylists < ActiveRecord::Migration
  def change
    create_table :liked_playlists do |t|
      t.belongs_to :user 
      t.belongs_to :playlist
    end
  end
end
