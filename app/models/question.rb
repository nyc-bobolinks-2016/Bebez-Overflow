class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :answers

  def total_votes
    self.votes.reduce(0) { |total, vote| total += vote.vote_value }
  end

end
