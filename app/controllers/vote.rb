post "/questions/:id/votes/down" do
  @question =  Question.find_by(id: params[:id])
  vote = Vote.new(voteable: @question, voter: current_user, vote_value: -1 )
  if vote.save
    status 200
    total_votes(@question).to_s
  else
    status 500
    erb :'/questions/show'
  end
end


post "/questions/:id/votes/up" do
  @question =  Question.find_by(id: params[:id])
  vote = Vote.new(voteable: @question, voter: current_user, vote_value: 1 )
  if vote.save
    status 200
    total_votes(@question).to_s
  else
    status 500
    erb :'/questions/show'
  end
end


post "/questions/:id/comments/:comment_id/votes/down" do
  @comment =  Comment.find_by(id: params[:comment_id])
  vote = Vote.new(voteable: @comment, voter: current_user, vote_value: -1 )
  if vote.save
    status 200
    total_votes(@comment).to_s
  else
    status 500
    erb :'/questions/show'
  end
end

post "/questions/:id/comments/:comment_id/votes/up" do
  @comment =  Comment.find_by(id: params[:comment_id])
  vote = Vote.new(voteable: @comment, voter: current_user, vote_value: 1 )
  if vote.save
    status 200
    total_votes(@comment).to_s
  else
    status 500
    erb :'/questions/show'
  end
end


post "/questions/:id/answers/:answer_id/votes/down" do
  @answer =  Answer.find_by(id: params[:answer_id])
  vote = Vote.new(voteable: @answer, voter: current_user, vote_value: -1 )
  if vote.save
    status 200
    total_votes(@answer).to_s
  else
    status 500
    erb :'/questions/show'
  end
end

post  "/questions/:id/answers/:answer_id/votes/up" do
  @answer =  Answer.find_by(id: params[:answer_id])
  vote = Vote.new(voteable: @answer, voter: current_user, vote_value: 1 )
  if vote.save
    status 200
    total_votes(@answer).to_s
  else
    status 500
    erb :'/questions/show'
  end
end



post "/questions/:id/answers/:answer_id/comments/:comment_id/votes/down" do
  @comment =  Comment.find_by(id: params[:comment_id])
  vote = Vote.new(voteable: @comment, voter: current_user, vote_value: -1 )
  if vote.save
    status 200
    total_votes(@comment).to_s
  else
    status 500
    erb :'/questions/show'
  end
end

post  "/questions/:id/answers/:answer_id/comments/:comment_id/votes/up" do
  @comment =  Comment.find_by(id: params[:comment_id])
  vote = Vote.new(voteable: @comment, voter: current_user, vote_value: 1 )
  if vote.save
    status 200
    total_votes(@comment).to_s
  else
    status 500
    erb :'/questions/show'
  end
end
