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
    redirect '/questions'
  else
    status 500
    @errors = question.errors.full_message
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/edit'
end

put '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @question.update(user: current_user, title: params[:title] , body: params[:body])
  if @question.save
    status 200
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
