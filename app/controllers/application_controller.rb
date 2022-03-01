require 'rack-flash'
class ApplicationController < Sinatra::Base
    use Rack::Flash
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

    #live coding note 
    # get '/about' do 
    #     if logged_in? && current_user
    #        "Thank for being a member, #{current_user.username}."
    #     else 
    #         "please login or signup"
    #     end
    # end

    helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
            User.find(session[:user_id])
		end
	end



end