get '/login' do
  erb :'/sessions/login'
end

post '/login' do
  user = User.find_by_email(params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    '404'
    @errors = ['invalid email or password']
    erb :'/sessions/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
