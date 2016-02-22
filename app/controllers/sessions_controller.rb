class SessionsController < ApplicationController

  def create
	  user = User.find_by(email: params[:session][:email].downcase)
	  if user && user.authenticate(params[:session][:password])
			log_in user
			params[:session][:remember_me] == '1' ? remember(user) : forget(user)
			redirect_to user
	  else
			flash.now[:danger] = 'Invalid username/password'#flash.now messages disappear after another request is sent 
		  render 'new'
	  end
  end

  def destroy
		log_out if logged_in?
		redirect_to root_url
  end

end
