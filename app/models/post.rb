class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :user_id
  
  default_scope order: 'posts.created_at DESC'
  validates :user , :content , :presence=> true

  
end
