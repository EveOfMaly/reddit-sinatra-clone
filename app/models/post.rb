class Post < ActiveRecord::Base 
    has_many :postsubs
    belongs_to :user 
    has_many :subs, through: :postsubs


    def slug
        self.username.parameterize
    end
    
end