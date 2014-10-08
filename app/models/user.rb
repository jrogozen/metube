class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :videos
  has_many :playlists
  has_many :comments

  validate :email, :presence => true, :uniqueness => true
end
