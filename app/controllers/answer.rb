post '/questions/:id/answer' do
  @question = Question.find_by(id: params[:id])
  @answer = Answer.new(content: params[:content], responder: current_user, question: @question)
  if @answer.save
    status 200
    erb :'/answers/_show_answer', layout: false, locals: { answer: @answer }
  else
    status 500
    @errors = @answer.errors.full_messages
    erb :'/answers/_answer'
  end
end


put '/questions/:id/answers/:answer_id/favorite' do
  @answer = Answer.find_by(id: params[:answer_id])
  @question = @answer.question
  @question.answers.each do |answer|
     answer.update(favorite: false) unless answer == @answer
  end

  if @answer.favorite
      @answer.update(favorite: false)
  else
      @answer.update(favorite: true)
  end
  redirect "/questions/#{@question.id}"

end
