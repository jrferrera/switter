class SessionsController < ApplicationController
  def new
  	if defined? session[:id]
      redirect_to home_path
    end

  	@title = "Sign in"
  end

  def create
  	if defined? session[:id]
      redirect_to home_path
    end
    
  	user = User.find_by_username(params[:username]) 

	if user.nil?
		# flash.now[:error] = "Invalid username/password."
		@title = "Sign In"
		render 'new'
	else
		if user.authenticate(params[:password])
			session[:logged_in] = true
			session[:id] = user.id
			session[:username] = user.username
			redirect_to home_path
		else
			render 'new'
		end
	end
  end

  def destroy
  		reset_session
  		redirect_to signin_path
  end
end
