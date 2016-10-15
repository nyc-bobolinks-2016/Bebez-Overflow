post "/answers/:id/comments" do
    @commentable = Answer.find_by(id: params[:id])
    @comment = Comment.new(text: params[:text], commenter: current_user, commentable: @commentable)

    if @comment.save
      status 200
      erb :'/comments/_show_answer_comment', layout: false,  locals: { comment: @comment }
    else
     status 500
     @errors = @comment.errors.full_messages
     erb :"comments/_comment"
    end
end

post "/questions/:id/comments" do
    @commentable = Question.find_by(id: params[:id])
    @comment = Comment.new(text: params[:text], commenter: current_user, commentable: @commentable)

    if @comment.save
      status 200
      erb :'/comments/_show_question_comment', layout: false,  locals: { comment: @comment }
    else
     status 500
     @errors = @comment.errors.full_messages
     erb :"comments/_comment"
    end
end
