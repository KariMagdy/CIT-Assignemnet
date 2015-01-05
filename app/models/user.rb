class User < ActiveRecord::Base
	has_many :posts , :dependent => :destroy
	has_many :relation_ships , :foreign_key => 'follower_id' ,:dependent => :destroy
	has_many :followeds , :through=> :relation_ships
	has_many :reverse_relation_ships , :foreign_key => 'followed_id' ,:dependent => :destroy
	has_many :followers , :through=> :reverse_relation_ships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
end
