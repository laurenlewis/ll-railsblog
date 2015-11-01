class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]   

  def index 
  	#variable users, User class, .all Method
    @users = User.all  
    @post = Post.all
  end   

  def show
  	@user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  	@user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  	@user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy   
    @user = User.find(params[:id])   
    if @user.destroy     
      session.destroy
      flash[:notice] = "Your account has been deleted successfully."   
    else     
      flash[:alert] = "There was a problem deleting the user."   
    end   
    redirect_to :back
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
      params.require(:user).permit(:fname, :lname, :email, :password)
    end

end