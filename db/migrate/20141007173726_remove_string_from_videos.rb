class RemoveStringFromVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :string
  end
end
