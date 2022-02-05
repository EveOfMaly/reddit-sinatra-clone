class User < ActiveRecord::Base 
    has_many :post
    has_many :subs, through: :post
    has_secure_password
    
end