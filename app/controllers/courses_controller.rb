class CoursesController < ApplicationController
	before_action :logged_in_trainee, only: [:index, :show]

	def index
		@user = current_user
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