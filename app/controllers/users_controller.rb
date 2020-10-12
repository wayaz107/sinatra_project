require 'pry'
class UsersController < ApplicationController

get '/signup' do
    if !logged_in?
   erb :'users/signup'
   else
    redirect '/travels'
   end 
end 

post '/signup' do
    @user = User.create(params)
    session[:user_id] = @user.id
    redirect ''
    

end 

get '/login' do
  erb :'/users/login'
end 

post '/login' do
  @user = User.find_by(username: params[:username])
   if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
  redirect ??
   else
    redirect '/login'
   end 
end 

get '/logout' do
  session.clear
  redirect '/'
 end 
end