class Supervisors::SessionsController < ApplicationController
  def new

  end

  def create
  	supervisor = User.find_by(email: params[:session][:email].downcase)
  	if( supervisor && supervisor.authenticate(params[:session][:password]) && supervisor.supervisor?)
  		log_in supervisor
  		redirect_to supervisors_user_path(supervisor)
  	else
      if (!supervisor.supervisor?)
        flash.now[:danger] = 'Not supervisor'
  		else
        flash.now[:danger] = 'Invalid email/password combination'
      end
  		render 'new'
  	end
  end

  def destroy
  	log_out
  	redirect_to root_path
  end

end
