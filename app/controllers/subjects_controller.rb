class SubjectsController < ApplicationController
	before_action(:logged_in_trainee, :only => :show)

	def index
		
	end

	def show
		@subject = Subject.find_by(id: params[:id])
	end

	def new
		
	end

	def create
		@task_ids = params[:id]
		if !@task_ids.nil?
			@task_ids.each do |t|
				@ut = UserTask.new(user_id: current_user.id, task_id: t)
				@ut.save
			end

			
			redirect_to	courses_url
			# render 'show'
		else

			redirect_to courses_url
		end
	end


end