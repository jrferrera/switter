class HomeController < ApplicationController
	def index
		if session[:logged_in]
			@user = User.find(session[:id])
			@swits = Swit.all
			@swit = Swit.new
			@comments = Comment.all
			@comment = Comment.new
		else
			redirect_to signin_path
		end
	end
end