class SessionsController < ApplicationController
  def new
    if !session[:logged_in].nil?
      redirect_to home_path
    end

  	@title = "Sign in"
  end

  def create
  	user = User.find_by_username(params[:username]) 

	if user.nil?
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
      session[:logged_in] = nil
  		reset_session
  		redirect_to signin_path
  end
end
