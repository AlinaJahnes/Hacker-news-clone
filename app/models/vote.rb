class Vote < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  def user_can_vote?
    vote = Vote.where(user_id: self.user_id, article_id: self.article_id)
    return vote.empty? 
  end
end
