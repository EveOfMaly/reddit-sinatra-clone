class UserController < ApplicationController

    #new user creation

    get '/new' do 
        erb :'users/new_user'
    end

    post '/' do 

        if params[:username] == "" || params[:password] == "" 
            redirect "/"
        end

        user = User.new(username: params[:username], password: params[:password])

        if user.save 
            session[:user_id] = user.id
            erb :'users/homefeed'
        else
            redirect "/"
        end
    end

    #login
    get '/login' do 
        erb :"users/login"
    end

    post '/login' do 
        user = User.find_by(username: params[:username])
       
        if user && user.authenticate(params[:password])
            user.create_slug
            user.save
            redirect  "" 
        else 
            redirect "failure"
        end
    end


    #show
    get "/user/:slug" do 
        @user = User.find_by_slug(params[:slug])
        erb :'users/show'
    end

    #edit user 


    get '/user/edit' do 
        erb :'users/edit'
    end

    get '/users/:slug' do 
        session.destroy 
    end



    #delete account 

    delete '/users/:slug' do 
        @user = User.find_by_slug(params[:slug])
        @user.destory 
    end
    
    #logout 

    get '/users/:slug' do 
        session.destroy 
    end

end