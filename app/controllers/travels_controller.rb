class TravelsController < ApplicationController

#read all
get "/travels" do
    if_not_logged_in
@travels = Travel.all
erb :'/travels/index'
end 

#create 
get "/travels/new" do
erb :'travels/new'
end 

#post create
post "/travels" do
    binding.pry
    # @travel = Travel.create(itinerary: params[:itinerary], date_leave: params[:date_leave], date_return: params[:date_return], travel_purpose: params[:travel_purpose], notes: params[:notes])

end 

#read individual
get "/travels/:id" do
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