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
        #associate post with user
        @user.posts << @post 
        #associate post with subreddit 
       binding.pry
        #save
    end
end


get "/posts/:id" do 

end

get "/posts/:id/edit" do 

end


patch "/posts/:id/" do 

end

delete "/posts/:id/" do 

end



end