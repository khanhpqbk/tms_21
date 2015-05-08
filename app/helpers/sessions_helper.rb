module SessionsHelper
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

	# confirm login trainee
	def logged_in_trainee
	    unless (logged_in? && !current_user.supervisor?)
	      flash[:danger] = "Please log in (as a trainee)."
	      redirect_to login_url
	    end
	end

	# confirm correct user

	def correct_user

		@user = User.find_by(id: params[:id])
		unless ( @user.supervisor? ? (current_user == @user) : (current_user == @user || current_user.supervisor?) )
			flash[:danger] = "Not correct user."
			redirect_to root_url
		end
		
	end

	# confirm login user
	def logged_in_user
	    unless (logged_in?)
	      flash[:danger] = "Please log in (as a trainee)."
	      redirect_to login_url
	    end
	end

end
