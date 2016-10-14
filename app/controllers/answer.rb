get '/questions/:id/answers' do
  @question = Question.find_by(id: params[:id])
  erb :'/answers/_answer'
end


post '/questions/:id/answer' do
  @question = Question.find_by(id: params[:id])
  @answer = Answer.new(content: params[:content], responder: current_user, question: @question)
  if @answer.save
    redirect '/'
  else
    @errors = @answer.errors.full_messages
    erb :'/answers/_answer'
  end
end
