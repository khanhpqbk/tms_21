class UsersController < ApplicationController

	def index
		@users = User.where(supervisor: false).all.paginate(page: params[:page])
	end
  def show
  	@user = User.find(params[:id])
    @courses = @user.courses.all
    # @subjects = @courses.find(1).subjects.all
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
  		redirect_to user_url(@user)
  	else
  		render 'new'
  	end
  end

  def destroy
    User.find_by(id: params[:id]).destroy
    flash[:success] = "User deleted! "
    redirect_to users_url
  end


private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
