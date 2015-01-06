class HomepageController < ApplicationController
  def home
  	@user = current_user
  	@post = Post.find_all_by_user_id(current_user)
  end
end
