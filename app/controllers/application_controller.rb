class ApplicationController < Sinatra::Base
    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions 
        set :session_secret, "reddit_clone_secret" 
    end

    #homepage
    get "/" do 
        if logged_in?
            erb :'users/homefeed' #not sure this is working
        else
            erb :"index"
        end
    end

    helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end



end