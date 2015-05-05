module SessionsHelper
	def log_in(user)
		session[:the_id] = user.id
		
	end

	def current_user
		@current_user ||= User.find_by(id: session[:the_id])
		
	end

	def logged_in?
		!current_user.nil?
	end

	def log_out
		session.delete(:the_id)
		@current_user = nil
	end
end
