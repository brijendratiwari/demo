class FeedController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json
  require 'date'
  require "net/http"
  require "uri"
  require 'rubygems'
  require 'json'


  def index
    redirect_to :controller => 'sessions', :action => 'connect' if !session[:access_token]

    client = Instagram.client(:access_token => session[:access_token])
    @user = client.user

    ## fetch recent media
    @recent_media_items = client.user_recent_media

    begin

      if @recent_media_items.pagination.empty?

      max_id = @recent_media_items.pagination.next_max_id
      response = client.user_recent_media(:max_id => max_id)
      end
      response.each do |media|



        if media.caption.present?
          @text = media.caption.text
        else
          @text = ''
        end

          @check = Photos.where("instagram_photo_id = #{media.id.split("_").first} and (user_id = #{media.id.split("_").last})")
        if @check.length == 0
          photo = Photos.create(instagram_photo_id: media.id.split("_").first, user_id: media.id.split("_").last, url: media.images.standard_resolution.url,discription: @text,publish_status:'Unpublished')
          photo.save
        end ## end of if
      end ## do loop
    end while !(max_id.to_s.empty?)

    redirect_to  admin_photos_path, alert: "Image imported successfully."
    ### end of while loop

  end


  ## get method
  def get_photo_feed

    redirect_to :controller => 'sessions', :action => 'connect' if !session[:access_token]
    message = {}
    http_code = 200
    client = Instagram.client(:access_token => session[:access_token])

    @user = client.user
    @photos = Photos.where("user_id = #{@user.id}");

    render json: @photos
  end

  def routin_call
    #uri = URI.parse("https://api.instagram.com/v1/users/2103727228/media/recent/?client_id=19057f98e341414bb9397cfc94433594")

    @cliet_id = ENV['client_id']

    @row =  Users.first;

    if @row.instagram_id.present?

    recent_posts = HTTParty.get "https://api.instagram.com/v1/users/"+@row.instagram_id.to_s+"/media/recent/?client_id="+@cliet_id.to_s

    @data = JSON.parse(recent_posts.body);

    @data['data'].each do |media|
       puts media

       if media['caption'].present?
         @text = media['caption']['text']
       else
         @text = ''
       end

       @check = Photos.where("instagram_photo_id = #{media['id'].split("_").first} and (user_id = #{media['id'].split("_").last})")
       if @check.length == 0
         photo = Photos.create(instagram_photo_id: media['id'].split("_").first, user_id: media['id'].split("_").last, url: media['images']['standard_resolution']['url'],discription: @text,publish_status:'Unpublished')
         photo.save
       end ## end of if
    end

    message = {:success => true,:message => "New photo added to database."}
    render :status => 200 , :json => message
    else

      message = {:success => false,:message => "No user found."}
      render :status => 200 , :json => message
    end

  end
end