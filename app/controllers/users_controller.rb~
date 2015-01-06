class UsersController < ApplicationController
	before_filter :authenticate_user!
  def show
  	@posts = User.find(params[:id]).posts
  	@user = User.find params[:id]
  end
  
  def index
  	@users = User.all
  end
  
end
