class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :answers

  def total_votes
    self.votes.reduce(0) { |total, vote| total += vote.vote_value }
  end

  def ordered_answers
    my_answers = []
    answer_favotire = self.answers.find{|an| an.favorite}
    my_answers.push(answer_favotire) if answer_favotire
    sorted = self.answers.reject{|answer| answer == answer_favotire }


    sorted.each do |a|
      my_answers.push(a)
    end
    my_answers
  end

end
