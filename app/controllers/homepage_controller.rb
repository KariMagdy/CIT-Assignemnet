class HomepageController < ApplicationController
	before_filter(:authenticate_user!)
  def home
  	@user = current_user  	
  	@posts = @user.posts
  	#current_user.followeds.each do |followed|
  		#@posts.push followed.posts
  	#end
  end
end
