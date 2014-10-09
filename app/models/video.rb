class Video < ActiveRecord::Base
  belongs_to :user

  has_many :comments

  has_many :videoPlaylists

  has_many :playlists, :through => :videoPlaylists

  has_many :favorites, :as => :favoritable

  validates :user, :presence => true
  validates :url, :presence => true
end
