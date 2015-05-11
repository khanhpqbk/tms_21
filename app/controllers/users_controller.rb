class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :logged_in_supervisor, only: [:index]
  # correct user bao gom chinh' trainee dang login  va cac supervisor
  before_action :correct_user, only: [:edit, :update]


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

  def edit
    @user = User.find_by(id: params[:id])

  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to user_url(@user)
    else

      render 'edit'
    end
  end

  def destroy
    User.find_by(id: params[:id]).destroy
    flash[:success] = "User deleted! "
    redirect_to users_url
  end



private
# :user o day tuong duong vs @user [?]
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

  
end
