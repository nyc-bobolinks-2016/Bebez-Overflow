class Answer < ActiveRecord::Base
  belongs_to :responder, class_name: :User
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :content, presence: true


end
