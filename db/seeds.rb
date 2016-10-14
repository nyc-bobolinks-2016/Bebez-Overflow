# 20.times do
#   post = Post.create!( title: Faker::Company.catch_phrase,
#                username: Faker::Internet.user_name,
#                comment_count: rand(1000),
#                created_at: Time.now - rand(20000))
#
#   vote_count = rand(100)
#   vote_count.times do
#     post.votes.create!(value: 1)
#   end
# end

User.create(username: "jesusmar", email: "jesusmarlima@gmail.com", password: "test")
User.create(username: "nanutza", email: "nanutza@gmail.com", password: "ilovejesus")
User.create(username: "jesusmarlima", email: "jesusmar@gmail.com", password: "ilovebebenan")
User.create(username: "corgiluver", email: "corgiallday@aol.com", password: "ilovecorgis")
User.create(username: "NaN", email: "amianumber@gmail.com", password: "maxmin")

quest1 = Question.create(title: "Is there such a thing as too many partials?", body: "blah, blah, blah, blah, i like partials and sunny's socks.", user_id: 1)
quest2 = Question.create(title: "Corgis: Luv them or not?", body: "woff, woff, bahha, blah, feed me keebles.", user_id: 3)

an1 = Answer.create(content: "Nothing wrong about loving Sunny's socks.", responder_id: 5, question_id: 1)
an2 = Answer.create(content: "I love them prints, they pop", responder_id: 4, question_id: 1)
an3 = Answer.create(content: "Bones R us", responder_id: 2, question_id: 2)

comm1 = Comment.create(text: "what am i commenting on 2", commentable: an2, commenter_id: 3)
comm2 = Comment.create(text: "what am i commenting on 1", commentable: an1, commenter_id: 2)

Vote.create(voter_id: 2, voteable: comm1, vote_value: 1)
Vote.create(voter_id: 4, voteable: comm2, vote_value: -1)
Vote.create(voter_id: 3, voteable: an1, vote_value: 1)
Vote.create(voter_id: 5, voteable: an2, vote_value: 1)
Vote.create(voter_id: 2, voteable: quest1, vote_value: 1)
Vote.create(voter_id: 3, voteable: quest1, vote_value: 1)
Vote.create(voter_id: 5, voteable: quest1, vote_value: -1)
Vote.create(voter_id: 5, voteable: quest2, vote_value: -1)
