class HomeController < ApplicationController
	def index
		@user = User.find(session[:id])
		@swits = Swit.all
		@swit = Swit.new
		@comments = Comment.all
		@comment = Comment.new
	end
end
