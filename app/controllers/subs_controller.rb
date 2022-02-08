class SubController < ApplicationController

    #display all the subreddits
    get '/subreddits' do 
        erb :'subs/index'
    end

    #new
    get "/subreddits/new" do 
        erb :'subs/new'
    end

    post "/subreddits" do 
    
        if params[:sub][:title] == "" || params[:sub][:description] == "" 
            redirect "/subreddits"
        end

        @sub = Sub.new(title: params[:sub][:title], description: params[:sub][:description])
        @sub.moderator_id = current_user
        if @sub.save 
           redirect "/"
        else
            redirect "/failure"
        end
    end


    #display individual subreddit 
    get '/subreddits/:id' do 
    
        @sub = Sub.find_by(id: params[:id])
        erb :'subs/show'
    end

  
    #edit 
    get '/subreddits/:id/edit' do 
        @sub = Sub.find(params[:id])
        erb :'subs/edit'
    end

    patch '/subreddits/:id' do 
#if user == moderator make changes
        if params[:sub][:title] == "" || params[:sub][:description] == "" 
            redirect "/subreddits"
        end

        @sub = Sub.find(params[:id])
        @sub.update(title: params[:sub][:title], description: params[:sub][:description])
        @sub.save
    #else redirect to homepage
    end


      #logout 
      get '/subreddits/:id/' do 
        if logged_in?
            session.destroy 
            redirect "/login"
        else
            redirect "/" #redirect to "/" if not logged in
        end

      end
  
      
      delete '/subreddits/:id/' do 
        @sub = Sub.find_by(id: params[:id])
        @sub.destory 
      end








    


end