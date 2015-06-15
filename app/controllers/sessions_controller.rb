require "instagram"

class SessionsController < ApplicationController
  def connect
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  def callbackurl
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:access_token] = response.access_token

    client = Instagram.client(:access_token => session[:access_token])

    @user = client.user
    check = Users.find_by_user_name(@user.username)

    if !check
      user = Users.create(user_name: @user.username, profile_image_url: @user.profile_picture, full_name: @user.full_name,instagram_id: @user.id)
      user.save
    else
      user = Users.find_by_instagram_id(@user.id);
      user.profile_image_url = client.user.profile_picture.to_s
      user.full_name = @user.full_name
      user.save
    end


    redirect_to :controller => 'feed', :action => 'index'
  end


end