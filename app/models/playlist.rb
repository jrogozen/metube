class Playlist < ActiveRecord::Base
  belongs_to :user

  has_many :videoPlaylists
  has_many :videos, :through => :videoPlaylists

  has_many :favorites, :as => :favoritable

  validates :user, :presence => true
end
