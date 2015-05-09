class SubjectsController < ApplicationController
	before_action(:logged_in_trainee, :only => :show)

	def index
		
	end

	def show
		@subject = Subject.find_by(id: params[:id])
	end


end