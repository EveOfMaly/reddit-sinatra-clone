class User < ActiveRecord::Base 
    has_many :posts
    has_many :subs, through: :post
    has_secure_password


    def slug
        self.username.parameterize
    end

    def self.find_by_slug(slug)
        User.all.find {|user| user.slug == slug}
    end
    
end