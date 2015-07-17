class Article < ActiveRecord::Base
  has_many :comments
  has_many :votes
  belongs_to :user
  validates :title, :body, presence: true
end
