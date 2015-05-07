class Supervisors::UsersController < ApplicationController

	def index
		@supervisors = User.where(supervisor: true).all 
	end
  def show
  	@supervisor = User.find(params[:id])
   
  end

 # GET /users/
  def new
  	
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		log_in @user
  		# add to flash variable (need to render in views)
  		flash[:success] = "Welcome to ruby on rails"
  		redirect_to user_path(@user)
  	else
  		render 'new'
  	end
  end


private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
