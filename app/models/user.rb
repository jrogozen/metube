class User < ActiveRecord::Base
  has_many :videos

  validate :email, :presence => true, :uniqueness => true
end
