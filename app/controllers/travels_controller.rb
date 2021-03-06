class TravelsController < ApplicationController

###read all 
  get '/travels' do
    if logged_in?
        @travels = Travel.all
        @user = current_user
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
        flash[:message] = "Sorry something went wrong, please try again!"
        redirect '/login'
    end 
   end 

###post create
  post '/travels' do
    if params[:trip_name].blank? || params[:itinerary].blank? || params[:start_date].blank? || params[:end_date].blank? || params[:notes].blank? 
        flash[:message] = "Unable to create a New Trip. Please do not leave any field blank." 
        redirect '/travels/new'
        else
       @travel = Travel.new(trip_name: params[:trip_name],itinerary: params[:itinerary], start_date: params[:start_date], end_date: params[:end_date],notes: params[:notes])
       @travel.user = current_user 
       @travel.save
       redirect to "/travels/#{@travel.id}"
    end 
  end

###read individual
  get "/travels/:id" do
    if logged_in?
      @travel = Travel.find_by(id: params[:id])
      erb :'/travels/show'
    else
       flash[:message] = "Please login to view this page."
       redirect to '/login'
    end 
  end 

###edit
  get '/travels/:id/edit' do
     @travel = Travel.find_by(id: params[:id])
     if logged_in? && current_user.id == @travel.user_id
        erb :'/travels/edit'
    else
        flash[:message] = "Not authorized to edit this trip!"
        redirect '/travels'
    end 
  end 

  
#####patch
  patch "/travels/:id" do
    if params[:trip_name].empty? || params[:itinerary].empty? || params[:start_date].empty? || params[:end_date].empty? || params[:notes].empty? 
        flash[:message] = "Unable to Edit this Trip. Please do not leave any field blank." 
            redirect "/travels/#{params[:id]}/edit"
    else
    @travel = Travel.find_by(id: params[:id])
    @travel.update(trip_name: params[:trip_name],itinerary: params[:itinerary], start_date: params[:start_date], end_date: params[:end_date],notes: params[:notes])
    redirect "/travels/#{@travel.id}"
    end 
   end 

#delete
    delete "/travels/:id/delete" do
      @travel = Travel.find(params[:id])
       if logged_in? && current_user == @travel.user
        @travel.delete
        flash[:message] = "You successfully deleted your trip"
        redirect '/travels'
       else
        flash[:message] = "You are not authorized to delete this trip"
        redirect "travels/#{@travel.id}"
       end 
    end 
end 
