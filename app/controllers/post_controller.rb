
class PostController < ApplicationController


#new post
get '/posts/new' do 
    erb :"posts/new"
end

#create post 
post "/posts" do 
    if params[:post][:title] == "" || params[:post][:content] == ""
        flash[:message] = "Missing information. Changes were not made. Please fill in all required information in the post."
        redirect "/posts/new"
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
        flash[:message] = "Post was sucesfully made."
        redirect "/posts/#{@post.id}"
    end
end

#get posts
get "/posts/:id" do 
    @post = Post.find_by(id: params[:id])
    erb :'posts/show'
end

#edit posts
get "/posts/:id/edit" do 
    @post = Post.find_by(id: params[:id])
    if logged_in? && current_user == @post.user
        erb :'posts/edit'
    else
        redirect "/posts/#{@post.id}"
    end
end

#update
patch '/posts/:id' do 
    @post = Post.find_by(id: params[:id])
    #moderator is allowed to update the title and description

    if logged_in? && @post.user == current_user
        if params[:post][:title] == "" || params[:post][:content] == "" || params[:post][:link] == "" 
            flash[:message] = "Missing information. Changes were not made. Please fill in all required information in the post." #message showed up
            redirect "/posts/#{@post.id}"
        else
            @post.update(title: params[:post][:title], link: params[:post][:link], content: params[:post][:content])
            
            params[:sub_ids].each do |sub|
                    @sub = Sub.find(sub.to_i)
                    @post.subs << @sub
             end
            @post.slug = "/posts/#{@post.id}" 
            @post.save 
            flash[:message] = "Post was sucesfully made."
            redirect "/posts/#{@post.id}"
        end
    else
        redirect "/subreddits"
    end
end



    delete "/posts/:id" do 
        @post = Post.find_by(id: params[:id])
        if logged_in? && @post.user == current_user
            @post.destroy
            redirect "/subreddits"
        else
            redirect "/subreddits"
        end
    end


end