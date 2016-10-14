get "/answers/:id/comments" do
    @answer = Answer.find_by(id: params[:id])
    erb :"comments/_comment"
end


post "/answers/:id/comments" do
    @answer = Answer.find_by(id: params[:id])
    @comment = Comment.new(text: params[:text], commenter: current_user, commentable: @answer)

    if @comment.save
      status 200
      redirect '/'
    else
     status 500
     @errors = @comment.errors.full_messages
     erb :"comments/_comment"
    end
end
