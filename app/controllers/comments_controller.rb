class CommentsController < ApplicationController

  def new
  	@comment = Comment.new
  	@post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    if session[:session_user_id]
      # Assign the Post a User 
	  @comment = @post.comments.create(comment_params)
      @comment[:user_id] = session[:session_user_id]
      @comment.save
	end
	redirect_to post_path (@post)
  end

  private 
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
