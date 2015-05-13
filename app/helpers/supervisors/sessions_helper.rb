module Supervisors::SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
		
	end

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
		
	end

	def logged_in?
		!current_user.nil?
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	def logged_in_supervisor
	    unless logged_in? && current_user.supervisor?
	    	log_out
	      	flash[:danger] = "Please log in (as a supervisor)."
	      	redirect_to supervisors_login_url
	    end
  	end


end
