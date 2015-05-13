class Supervisors::UsersCoursesController < ApplicationController
	before_action :logged_in_user, only: [:index]
	def index
		@course = Course.find_by(id: session[:course_id])
		@users_courses = @course.users.paginate(page: params[:page])
	end

	def create
		@users_id = params[:users]
		@course_id = params[:course]

		@users_id.each do |u|
			@uc = UserCourse.find_by(user_id: u.to_i, course_id: @course_id.to_i)
			if @uc.nil?
				@uc = UserCourse.new(user_id: u.to_i, course_id: @course_id.to_i)
				@uc.save
			end
		end

		@courses = Course.all
		redirect_to supervisors_courses_path

	end

end