class Video < ActiveRecord::Base
  belongs_to :user

  has_many :videoPlaylists

  has_many :playlists, :through => :videoPlaylists

  validates :user, :presence => true
  validates :url, :presence => true
end
