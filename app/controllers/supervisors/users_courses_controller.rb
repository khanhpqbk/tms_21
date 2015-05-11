class Supervisors::UsersCoursesController < ApplicationController
	before_action :logged_in_user, only: [:index]
	def index
		@course = Course.find_by(id: session[:course_id])
		@users_courses = @course.users.paginate(page: params[:page])
	end

end