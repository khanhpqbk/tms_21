class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

 # GET /users/
  def new
  	
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
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
