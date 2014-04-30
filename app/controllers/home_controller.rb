class HomeController < ApplicationController
  def index
  	@swits = Swit.all
  	@swit = Swit.new
  	@comments = Comment.all
  	@comment = Comment.new
  end
end
