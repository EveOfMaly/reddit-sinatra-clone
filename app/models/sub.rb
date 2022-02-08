class Sub < ActiveRecord::Base 
    has_many :postsubs
    belongs_to :user
    has_many :posts, through: :postsubs
end