class User < ActiveRecord::Base
  has_many :videos
  has_many :playlists

  validate :email, :presence => true, :uniqueness => true
end
