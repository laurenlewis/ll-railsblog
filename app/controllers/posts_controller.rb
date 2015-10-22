class PostsController < ApplicationController   

  def index 
  	#variable users, User class, .all Method
    @posts = Post.all  
    @users = User.all
  end   

  def update   
  end 

end