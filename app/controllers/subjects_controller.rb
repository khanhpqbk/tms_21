class SubjectsController < ApplicationController
	before_action(:logged_in_user, :only => :show)

	def index
		
	end

	def show
		@user = User.find_by(id: params[:user_id])
		@course = Course.find_by(id: params[:course_id])
		@subject = Subject.find_by(id: params[:id])
	end

	def new
		
	end

	# cap nhat tien do. hoc tap.
	# report day by day
	def create
		@task_ids = params[:id]
		if !@task_ids.nil?
			@task_ids.each do |t|
				@ut = UserTask.new(user_id: current_user.id, task_id: t)
				@ut.save
			end
			@task = Task.find_by(id: @task_ids.first)
			@subject = @task.subject  

			# neu hoan thanh subject thi luu vao user_subject
			if finish_subject?(@subject)
				@us = UserSubject.new(user_id: current_user.id, subject_id: @subject.id)
				@us.save
			end
			redirect_to	@subject
			
		else

			redirect_to courses_url
		end
	end

private 
	# hoan thanh subject <=> hoan thanh tat ca task trong do
	def finish_subject?(subject)

		@tasks = subject.tasks
		@finish_tasks = current_user.tasks

		@tasks.each do |t|
			if !@finish_tasks.include?(t)
				return false
			end
		end

		return true
	end

end