

class SubController < ApplicationController
    
    #display all the subreddits
    get '/subreddits' do 
        if logged_in?
            erb :'subs/index'
        else
            redirect "/"
        end
    end

    #new
    get "/subreddits/new" do 
        if logged_in?
            erb :'subs/new'
        else
            redirect "/"
        end
    end

    post "/subreddits" do 
    

        if params[:sub][:title] == "" || params[:sub][:description] == "" 
            flash[:message] = "Subreddit was not created." #message showed up
            redirect "/"
        end

        @sub = Sub.new(title: params[:sub][:title], description: params[:sub][:description])
       
        current_user.subs << @sub
        if @sub.save 
            flash[:message] = "Subreddit was succesfully created."
           redirect "/"
        else
            redirect "/failure"
        end
    end


    #display individual subreddit 
    get '/subreddits/:id' do 
        if logged_in?
            @sub = Sub.find_by(id: params[:id])
            erb :'subs/show' 
        else 
            redirect "/"
        end
    end

  
    #edit 
    get '/subreddits/:id/edit' do
        @sub = Sub.find(params[:id])
        if logged_in? && current_user == @sub.user
            erb :'subs/edit'
        else
            redirect "/subreddits"
        end
    end

    patch '/subreddits/:id' do 
        @sub = Sub.find(params[:id])
        if current_user == @sub.user
            if params[:sub][:title] == "" || params[:sub][:description] == "" 
                flash[:message] = "Missing information. Changes were not made. Please fill in all required information in the subreddit."
                redirect "/subreddits"
            end
            @sub.update(title: params[:sub][:title], description: params[:sub][:description])
            @sub.save
            flash[:message] = "Subreddit was succesfully edited."
            redirect "subreddits/#{@sub.id}"
        else
            flash[:message] = "Not the owner of this subreddit. You can only edit subreddits you own."
            redirect "/"
        end
    end


      #logout 
      get '/subreddits/:id/' do 
        if logged_in?
            session.destroy 
            redirect "/login"
        else
            redirect "/" 
        end

      end
  
      
      delete '/subreddits/:id' do 
        @sub = Sub.find_by(id: params[:id])
        @sub.destory 
      end








    


end