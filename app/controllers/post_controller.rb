class PostController < ApplicationController

# #create
get "/posts" do 

end

#new

get '/posts/new' do 
    erb :"posts/new"
end


post "/posts" do 
    if params[:post][:title] == "" || params[:post][:content] == ""
        redirect "/post/new"
    else
        #change :url to :link

        @post = Post.new(title: params[:post][:title], link: params[:post][:link], content: params[:post][:content])
        @user = current_user

        params[:sub_ids].each do |sub|
            @sub = Sub.find(sub.to_i)
            @post.subs << @sub
        end
        @post.user = @user
    
        #associate post with subreddit 
        @post.slug = "/posts/#{@post.id}"
        @post.save 

        redirect "/subreddits"
    end
end


get "/posts/:id" do 
    #add delete post 
end

get "/posts/:id/edit" do 

end


patch "/posts/:id/" do 

end

delete "/posts/:id/" do 

end



end