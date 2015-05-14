class Supervisors::UsersController < ApplicationController
  before_action :logged_in_supervisor, only: [:update, :edit]
  before_action :correct_user, only: [:edit, :update]

	def index
		@supervisors = User.where(supervisor: true).all 
    @course = Course.find_by(id: params[:course_id])
    @users = @course.users
	end

  def show
  	@supervisor = User.find(params[:id])
   
  end

 # GET /users/
  def new
  	
  	@supervisor = User.new
  end

  def create
  	@supervisor = User.new(user_params)

  	if @supervisor.save
  		log_in @supervisor
  		# add to flash variable (need to render in views)
  		flash[:success] = "Welcome to ruby on rails"
  		redirect_to superviosrs_user_url(@supervisor)
  	else
  		render 'new'
  	end
  end

  def edit
    @supervisor = User.find_by(id: params[:id])
  end

  def update
    @supervisor = User.find_by(id: params[:id])

    if @supervisor.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to supervisors_user_url(@supervisor)
    else
      render 'edit'
    end
  end

  def destroy
    User.find_by(id: params[:id]).destroy
    redirect_to supervisors_users_url
  end

private
	def user_params
		params.require(:supervisor).permit(:name, :email, :password, :password_confirmation)
	end

  
end
