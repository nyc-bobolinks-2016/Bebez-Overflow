# get '/questions/:id' do
#   @question = Question.find_by(id: params[:id])
#   @commentable = @question
#   erb :'/questions/show'
# end

get '/questions/:id/answers/new' do
  @question = Question.find_by(id: params[:id])
  erb :'/answers/_answer'
end

get "/answers/:id/comments/new" do
    @commentable = Answer.find_by(id: params[:id])
    erb :"comments/_answer_comment", layout: false, locals: {commentable: @commentable}
end

get "/questions/:id/comments/new" do
    @commentable = Question.find_by(id: params[:id])
    erb :"comments/_question_comment"
end
