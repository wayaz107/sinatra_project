require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "travel_secret"
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end 

    def current_user
      User.find_by(id: session[:user_id])
    end 

    def if_not_logged_in
      if !logged_in?
        flash[:message] = "You are currently not logged in"
        redirect '/login'
      end 
    end 
  end

end 
