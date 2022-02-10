require "rack-flash"
class UserController < ApplicationController
    use Rack::Flash
    

   #show individual user profile
    get "/users/:slug" do 
        if logged_in?
            @user = User.find_by_slug(params[:slug])
            erb :'users/show'
        else
            redirect "/"
        end
    end

  #form to creatae an individual user profile
    #new
     get '/new' do 
        if !logged_in?
            erb :'users/new_user'
        else 
            erb :'users/homefeed'
        end
    end

    #create an individual user profile
    post '/users' do 
    
            if params[:username] == "" || params[:password] == "" 
                flash[:message] = "Unable to create a user. Please add a username and password."
                redirect "/new"
            elsif User.find_by(username: params[:username])      
                flash[:message] = "Unable to create a user. Please add a username and password."
                redirect "/new"
            else               
                 @user = User.new(username: params[:username], password: params[:password])
                 if @user.save 
                    flash[:message] = "Account Successfully created." 
                    session[:user_id] = @user.id
                    erb :'users/homefeed'
                else
                    redirect "/"
                end
            end
    end




    #login
    get '/login' do 
        if logged_in?
            redirect "/"
        else
            erb :"users/login"
        end
    end

    post '/login' do 

        user = User.find_by(username: params[:username])
       
        if user && user.authenticate(params[:password])
            flash[:message] = "Successfully logged in."
            session[:user_id] = user.id
            redirect  "/" 
        else 
            flash[:message] = "Login failed. Please try again."
            redirect "/login"
        end
    end


    #edit user 

    get '/users/:slug/edit' do 
  
        @user = User.find_by_slug(params[:slug])
    
        if logged_in? && @user.id == current_user.id
            erb :'users/edit'
        else
            redirect "/"
        end
    end


    patch '/users/:slug' do  
    
        @user = User.find_by_slug(params[:slug])
        
        @user_find = User.find_by(username: params[:username])
      
        if logged_in? && @user.id == current_user.id
            if params[:username] == "" 
                flash[:message] = "Unable to create user. Please add a username."
                redirect "/users/:slug/edit"
            end

            
           
            if @user_find != nil && @user_find.username == params[:username] 
                flash[:message] = "Unable to create a user. Already being used." 
                redirect "/"
            end
            
            @user.update(username: params[:username], cakeday: params[:cakeday])
            
            @user.save
            flash[:message] = "Profile sucesfully edited."
            redirect "/"
           
        else
            flash[:message] = "Profile was not edited." #message worked.ß
            redirect "/"
        end
 
        
    end

    get '/users/:slug/goodbye' do 
        if logged_in?
            session.destroy 
            redirect "/"
        else
            redirect "/"
        end
    end

    #delete account 

    delete '/users/:slug' do 
        @user = User.find_by_slug(params[:slug])
        if @user.id == current_user.id
            session.destroy 
            @user.destroy 
            redirect "/"
        else
            redirect "/"
        end
    end
    

end