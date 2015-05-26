class CoursesController < ApplicationController
	before_action :logged_in_user, only: [:index, :show]

	def index
		# @user = User.find_by(id: session[:user_id])
		@user = User.find_by(id: params[:user_id])
		@courses = @user.courses.all
	end

	def show
		@course = Course.find_by(id: params[:id])
		
	end

	def new
		
	end

	def create
		
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

private


end