class PostsController < ApplicationController   

  def index 
  	#variable users, User class, .all Method
    @posts = Post.all  
    @users = User.all
  end   

  def show
  	@post = Post.find(params[:id])
  end

  def update   
  end 
  # def delete
  # 	@post = Post.find(params[:id])
  # 	@post.destroy
  # 	redirect back
  def destroy   
  	puts "PARAMS ARE" + params.inspect 

    @post = Post.find(params[:id])   
    if @post.destroy     
      flash[:notice] = "Post deleted successfully."   
    else     
      flash[:alert] = "There was a problem deleting the post."   
    end   
    redirect_to :back
  end

end