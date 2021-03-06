require 'rails_helper'

RSpec.describe RelationshipsController, :type => :controller do

  before :each do 
		@user = FactoryGirl.create :user, :email => "example@example.com", :password=>"00000000"
		sign_in @user
	end
	
	it "follow should add new followed" do
		@followed = FactoryGirl.create :user, :email => "followed@example.com", :password=>"00000000"
		post :create, :followed_id => @followed.id
		expect(@user.followeds.count).to be > 0
	end

end
