class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :title
      t.references :user, index: true

      t.timestamps
    end
  end
end
