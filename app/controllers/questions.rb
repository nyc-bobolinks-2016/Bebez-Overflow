
get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  @question = Question.new(user: current_user, title: params[:title] , body: params[:body])

  if @question.save
    status 200
    @question
    redirect '/questions'
  else
    status 500
    # if request.xhr?
    #
    # else
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :'/questions/edit'
end


put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.update(user: current_user, title: params[:title] , body: params[:body])
  if @question.save
    status 200
    @question
    redirect '/questions'
  else
    status 500
    redirect '/questions'
    # if request.xhr?
    #
    # else
  end
end
#
# delete '/questions/:id' do
#   # write logic for deleting posts here.
# end
#
# post '/questions' do
#   redirect '/questions'
# end
#
