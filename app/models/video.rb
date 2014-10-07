class Video < ActiveRecord::Base
  belongs_to :user
  validates :user, :presence => true
  validates :url, :presence => true

  searchkick
end
