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
