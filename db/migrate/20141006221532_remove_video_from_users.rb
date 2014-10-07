class RemoveVideoFromUsers < ActiveRecord::Migration
  def change
    remove_reference :users, :video
  end
end
