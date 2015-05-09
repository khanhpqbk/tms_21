class Supervisors::CoursesController < ApplicationController
	before_action :logged_in_user, only: :show
	before_action :logged_in_supervisor, only: [:index, :new, :create, :edit, :update, :delete]
	def index
		@courses = Course.all.paginate(page: params[:page])
	end

	def show
		@course = Course.find_by(id: params[:id])
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)
		if @course.save
			flash[:success] = "New course created"
			redirect_to supervisors_courses_url
		else
			render 'new'
		end
	end

	def edit
		@course = Course.find_by(id: params[:id])
	end

	def update
		@course = Course.find_by(id: params[:id])
		if @course.update_attributes(course_params)
			flash[:success] = "Course information updated"
			redirect_to supervisors_course_url(@course)
		else
			render 'edit'
		end
	end

	def destroy
		Course.find_by(id: params[:id]).destroy
		redirect_to supervisors_courses_url
	end

private

	# strong paramaters
	def course_params
		params.require(:course).permit(:name, :description)
	end

end