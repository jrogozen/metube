class RemoveAuthorFromVideoAndAddUser < ActiveRecord::Migration
  def change
    remove_reference :videos, :author
    add_reference :videos, :user
  end
end
