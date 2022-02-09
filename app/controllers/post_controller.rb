
class PostController < ApplicationController

get "/posts" do 

end

#new

#new post
get '/posts/new' do 
    erb :"posts/new"
end

#create post 
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

#get posts
get "/posts/:id" do 
    @post = Post.find_by(id: params[:id])
    erb :'posts/show'
end

#edit posts
get "/posts/:id/edit" do 
    @post = Post.find_by(id: params[:id])
    erb :'posts/edit'
end

#update
patch '/posts/:id' do 

    #moderator is allowed to update the title and description
    if params[:post][:title] == "" || params[:post][:content] == "" || params[:post][:link] == "" 
        redirect "/post/new"
    else
        binding.pry
        #if post.subs.owner == current_user    
            #make changes

        # # if @post.user == current_user 
        #     @post = Post.find_by(id: params[:id])
        #     @post.update(title: params[:post][:title], link: params[:post][:link], content: params[:post][:content])
        #     params[:sub_ids].each do |sub|
        #         @sub = Sub.find(sub.to_i)
        #         @post.subs << @sub
        #     end
        #     @post.slug = "/posts/#{@post.id}" 
        #     @post.save 
        #     redirect "/posts/#{@post.id}"
        # # else
        # #     "failure"
        # # end
    end
end



    delete "/posts/:id" do 
        @post = Post.find_by(id: params[:id])
        @post.destroy
        redirect "/subreddits"
    end


end