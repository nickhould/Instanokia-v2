require "instagram"
require 'geokit'
include GeoKit::Geocoders

class FeedController < ApplicationController
	def index
	  redirect_to :controller => 'sessions', :action => 'connect' if !session[:access_token] 

 		# the user input a location string
 		if params[:location].to_s.length > 5
 			location = params[:location]
 			coords = MultiGeocoder.geocode(location)
			@longitude = coords.lng
  		@latitude = coords.lat
  		if @latitude && @longitude
	  		distance = "1000"
			  client = Instagram.client(:access_token => session[:access_token])
	      user = client.user
	  		@recent_media_items = Instagram.media_search(@latitude, 
	    																						   @longitude, 
	    																						   distance: distance)
	  	end
  	# the system uses the user current location
  	elsif	params[:lon] && params[:lat]
	  	@longitude = params[:lon]
  		@latitude = params[:lat]
  		distance = "1000"
		  client = Instagram.client(:access_token => session[:access_token])
      user = client.user
      @recent_media_items = Instagram.media_search(@latitude, 
    																						   @longitude, 
 																						   distance: distance)
		end

 	end
end
