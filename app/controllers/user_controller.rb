class UserController < ApplicationController

    #new user creation
    get '/new' do 
        erb :'users/new_user'
    end

    post '/new' do 
        user = User.new(username: params[:username], password: params[:password])

        if user.save 
            redirect ""
        else
            redirect ""
        end
    end

    get '/login' do 
        erb :"users/login"
    end



    post '/login' do 
        @user = User.find_by(username: params[:username])
       
        if user && && user.authenticate(params[:password])
            redirect 
        else 
            redirect 
        end
    end

end