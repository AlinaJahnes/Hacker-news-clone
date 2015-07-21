class Article < ActiveRecord::Base
  has_many :comments#, dependent: destroy will get rid of all associated comments
  has_many :votes
  belongs_to :user
  validates :title, :body, presence: true
end
