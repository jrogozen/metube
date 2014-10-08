class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :video
  validate :user, :presence => true
  validate :video, :presence => true
end
