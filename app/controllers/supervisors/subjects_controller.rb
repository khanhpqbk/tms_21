class Supervisors::SubjectsController < ApplicationController
	def index
		@subjects = Subject.all.paginate(page: params[:page])
	end

	def show
		@subject = Subject.find_by(id: params[:id])
	end

	def new
		@subject = Subject.new
	end

	def create
		
	end

	def edit
		@subject = Subject.find_by(:id => params[:id])
	end

	def update
		@subject = Subject.find_by(id: params[:id])

    	@subject.update_attributes(name: params[:subject][:name], description: params[:subject][:description], instruction: params[:subject][:instruction])
    	if params[:task][:name] != ""
    		@task = Task.new(name: params[:task][:name], subject_id: params[:id])
    		@task.save
    	end
      flash[:success] = "Subject information updated"
      redirect_to supervisors_subject_url(@subject)
    
	end

	def destroy
		
	end

	# test
	def course
		
	end

end