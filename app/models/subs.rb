class Sub < ActiveRecord::Base 
    has_many :post
    has_many :users, through: :post
end