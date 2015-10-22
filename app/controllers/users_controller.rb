class UsersController < ApplicationController   

  def index 
  	#variable users, User class, .all Method
    @users = User.all  
    @post = Post.all
  end   

  def update   
  end 

end