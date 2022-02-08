class Sub < ActiveRecord::Base 
    has_many :users, through: :post
    has_many :posts, through: :postsubs
end