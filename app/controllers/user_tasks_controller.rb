class UserTasksController < ApplicationController
	def create
		@ut = UserTask.new(user_id: current_user.id, task_id: params[:task][:id])
		if @ut.save
			redirect_to subject_url(@subject)
		else

		end
	end

end