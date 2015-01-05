class UsersController < ApplicationController

  def show
  	@posts = User.find(params[:id]).posts
  	@user = User.find params[:id]
  end
  
  def index
  	@users = User.all
  end
  
end
