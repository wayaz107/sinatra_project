class TravelsController < ApplicationController

###read all 
  get '/travels' do
    if logged_in?
        @travels = Travel.all
        erb :'/travels/index'
    else
        flash[:message] = "You are currently not logged in"
        redirect '/login'
    end 
  end 

###create 
  get '/travels/new' do
    if logged_in?
        erb :'/travels/new'
    else
        flash[:message] = "You are currently not logged in"
        redirect '/login'
    end 
   end 

###post create
  post '/travels' do
    if params[:trip_name].blank? || params[:itinerary].blank? || params[:start_date].blank? || params[:end_date].blank? || params[:notes].blank? 
        flash[:message] = "Unable to create a New Trip. Please do not leave any field blank." 
        redirect '/travels/new'
        else
       @travel = Travel.create(trip_name: params[:trip_name],itinerary: params[:itinerary], start_date: params[:start_date], end_date: params[:end_date],notes: params[:notes])
       redirect to "/travels/#{@travel.id}"
    end 
  end

#read individual
  get "/travels/:id" do
    if logged_in?
      @travel = Travel.find_by(id: params[:id])
      erb :'/travels/show'
    else
       flash[:message] = "Please login to view this page."
       redirect to '/login'
    end 
  end 

#edit
get '/travels/:id/edit' do
end 

#patch
patch "/travels/:id" do
end 

#delete
delete "/travels/:id/delete" do
end 


end 