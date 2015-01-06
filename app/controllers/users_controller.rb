class UsersController < ApplicationController
	before_filter :authenticate_user!
  def show
  	@posts = User.find(params[:id]).posts
  	@user = User.find params[:id]
  	@following = User.find(params[:id]).followeds
    @followers = User.find(params[:id]).followers
  end
  
  def index
  	@users = User.all
  end
  
  def following
    @following_users = User.find(params[:id]).followeds
  end

  def followers
    @followers = User.find(params[:id]).followers
  end
  
end
