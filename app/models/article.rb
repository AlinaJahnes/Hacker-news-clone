require 'uri'

class Article < ActiveRecord::Base
  has_many :comments
  has_many :votes
  belongs_to :user
  validates :title, :body, presence: true

  def is_a_link?
    return true if self.body =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
