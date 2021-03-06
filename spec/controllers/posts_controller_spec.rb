require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

	before :each do 
		@user = FactoryGirl.create :user, :email => "example@example.com", :password=>"00000000"
		sign_in @user
	end
	
	it "should save the post if it is valid" do
		post = FactoryGirl.create(:post, :content => "example post" ,:user_id => @user.id)
		expect(post).to be_valid
		expect(response).to be_success
	end

	it "should add one post to the user" do
		post = FactoryGirl.create(:post, :content => "example post" ,:user_id => @user.id)
		expect(@user.posts.count).to be > 0
	end
	
	it "shouldn't save the post if it is invalid" do
		post = FactoryGirl.create(:post, :content => "" ,:user_id => @user.id)
		expect(post).to_not be_valid
		expect(@user.posts.count).to eql(0)
	end
	
	it "user other than author can't distroy" do
		@author = FactoryGirl.create :user, :email => "author@example.com", :password=>"00000000"
		post = FactoryGirl.create(:post, :content => "example post" ,:user_id => @author.id)
		delete :destroy, :user_id => @user.id, :id => post.id
		expect(response).to_not be_success
	end
	
	it "author can distroy" do
		post = FactoryGirl.create(:post, :content => "example post" ,:user_id => @user.id)
		delete :destroy, :user_id => @user.id, :id => post.id
		expect(response).to_not be_success
	end
	
  #describe "GET destroy" do
   # it "returns http success" do
    #  get :destroy
     # expect(response).to have_http_status(:success)
    #end
  #end

  #describe "GET create" do
   # it "returns http success" do
    #  get :create
     # expect(response).to have_http_status(:success)
   # end
  #end

end
