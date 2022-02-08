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

        redirect "/posts/#{@post.id}"
    end
end


get "/posts/:id" do 
    @post = post.find_by(id: params[:id])
    erb :'posts/show'
    #add delete post 
end

get "/posts/:id/edit" do 
    @post = post.find_by(id: params[:id])
    erb :'posts/edit'
end

patch "/posts/:id/" do 

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

        #if current user is owner 
        @post.user = @user
    
        #associate post with subreddit 
        @post.slug = "/posts/#{@post.id}"
        @post.save 

        redirect "/posts/#{@post.id}"
    end

end



delete "/posts/:id" do 
    @post = post.find_by(id: params[:id])
    @post.destory
end


end