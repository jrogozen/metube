class AddAvatarToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :photo
    add_column :users, :avatar, :string
  end
end
