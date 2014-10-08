class AddReferencestoComments < ActiveRecord::Migration
  def change
    add_reference :comments, :user
    add_reference :comments, :video
  end
end
