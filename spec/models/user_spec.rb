require 'rails_helper'

RSpec.describe User, :type => :model do
  before :each do 
		@user = FactoryGirl.create :user, :email => "example@example.com", :password=>"00000000"
		sign_in @user
	end
	
	it "should follow" do
		@followed = FactoryGirl.create :user, :email => "followed@example.com", :password=>"00000000"
		follow :followed_id => @followed.id
		expect(@user.followeds.count).to be > 0
	end
end
