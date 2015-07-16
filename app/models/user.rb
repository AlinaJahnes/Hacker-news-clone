class User < ActiveRecord::Base
  has_secure_password
  has_many :articles
  has_many :comments
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
end
