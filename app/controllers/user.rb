get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save && params[:user][:password] == params[:password_confirmation]
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = user.errors.full_message
    erb :'users/new'
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  @questions = @user.questions
  @answers = @user.answers
  @comments = @user.comments
  erb :'/users/show'
end
