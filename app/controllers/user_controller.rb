class UserController < ApplicationController

     #new user creation

        #show
    get "/users/:slug" do 
      
        @user = User.find_by_slug(params[:slug])
 
        erb :'users/show'
        
    end


    #new
     get '/new' do 
        if !logged_in?
            erb :'users/new_user'
        else 
            erb :'users/homefeed'
        end
    end

    #create
    post '/users' do 
    
            if params[:username] == "" || params[:password] == "" 
                redirect "/new"
            end

            @user = User.new(username: params[:username], password: params[:password])

            if @user.save 
                session[:user_id] = @user.id
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
        #BobMassa
        #cash
        user = User.find_by(username: params[:username])
       
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect  "/" 
        else 
            #failure message
            redirect "/login"
        end
    end


 

    #

    
    #edit user 

    get '/users/:slug/edit' do 
        @user = User.find_by_slug(params[:slug])
        if logged_in?
            erb :'users/edit'
        else
            redirect "/"
        end
    end

    patch '/users/:slug' do  
        @user = User.find_by_slug(params[:slug])
      
        if logged_in?
            if params[:username] == "" 
                redirect "/users/:slug/edit"
            else 
                @user.update(username: params[:username], cakeday: params[:cakeday])
                @user.save
                
                redirect "/users/#{@user.slug}"
            end
        else
            redirect "/"
        end
 
        
    end


    # get '/users/:slug' do 
    #     session.destroy 
    # end



    #delete account 

    delete '/users/:slug' do 
        @user = User.find_by_slug(params[:slug])
        @user.destory 
    end
    
    #logout 

    get '/users/:slug/goodbye' do 
        if logged_in?
            session.destroy 
            redirect "/login"
        else
            redirect "/"
        end
    end

end