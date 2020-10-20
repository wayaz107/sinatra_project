require 'pry'
class UsersController < ApplicationController

    get "/users/:id" do
        if logged_in?
        @user = User.find_by(id: params[:id])
        @current_user = current_user
        erb :'/users/show'
        else
            redirect '/login'
        end 
      end 
     

    get '/signup' do
       if logged_in?
        redirect to '/travels'
        else
        erb :'/users/signup'
       end 
     end 

     post '/signup' do
       if params[:first_name].empty? || params[:last_name].empty? ||params[:username].empty? || params[:email].empty? || params[:password].empty?
       flash[:message] = "Oops,something wasn't right. Please make sure to fill in all the fields."
       redirect '/signup'
        else 
       @user = User.new(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], email: params[:email], password: params[:password])
       @user.save
       session[:user_id] = @user.id
       redirect to "/users/#{@user.id}"
        end 
      end 

     get '/login' do
       if logged_in?
        redirect '/travels'
        else
        erb :'/users/login'
         end 
      end 

    post '/login' do
       @user = User.find_by(username: params[:username])
       if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect to "/users/#{@user.id}"
        else
        flash[:message] = "Login Failed. Please Try Again."
        redirect '/login'
      end 
    end 

    get '/logout' do
      if logged_in?
      session.clear
      flash[:message] = "Log Out Successful."
      redirect '/'
      end 
    end
end 