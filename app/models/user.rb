class User < ActiveRecord::Base
  has_many :questions
  has_many :comments, foreign_key: :commenter_id
  has_many :answers, foreign_key: :responder_id
  has_many :votes, foreign_key: :voter_id

  validates :username, :email, :password_digest, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create, message: "is invalid"

  has_secure_password 
end
