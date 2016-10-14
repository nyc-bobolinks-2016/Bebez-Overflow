post "/answers/:id/comments" do
    @commentable = Answer.find_by(id: params[:id])
    @comment = Comment.new(text: params[:text], commenter: current_user, commentable: @commentable)

    if @comment.save
      status 200
      redirect '/'
    else
     status 500
     @errors = @comment.errors.full_messages
     erb :"comments/_comment"
    end
end

post "/questions/:id/comments" do
    @question = Question.find_by(id: params[:id])
    @commentable = @question
    @comment = Comment.new(text: params[:text], commenter: current_user, commentable: @commentable)

    if @comment.save
      status 200
      erb :"/questions/show"
    else
     status 500
     @errors = @comment.errors.full_messages
     erb :"comments/_comment"
    end
end
