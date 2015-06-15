require "instagram"

class UserController < ApplicationController
  
    def index
    	redirect_to :controller => 'sessions', :action => 'connect' if !session[:access_token] 
		client = Instagram.client(:access_token => session[:access_token])
    	@user = client.user
    	check = Users.find_by_user_name(@user.username)
    	
    	if !check
    		user = Users.create(user_name: @user.username, profile_image_url: @user.profile_picture, full_name: @user.full_name,instagram_id: @user.id)
    		user.save
    	else
    		redirect_to :controller => 'sessions', :action => 'connect'
    	end	 	
		
  	end


end
