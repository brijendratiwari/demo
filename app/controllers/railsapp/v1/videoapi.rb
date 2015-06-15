# module API
module Railsapp
  module V1
    class Videoapi < Grape::API
      include Railsapp::V1::Defaults
      format :json
      resource :videoapi do

        desc "Return all videos"
        get "", root: :videos do
          error!({:error_message => "Please provide a video id."}, 422)
        end

        desc "Return a video"
        params do
          requires :id, type: Integer, desc: "ID of the video"
        end
        get ":id", root: "videos" do
          # Video.where(id: params[:id]).first
          @video = Contents.where(id: params[:id]).first

          if @video.present?

            @return_data =  Hash.new

            @return_data['id'] = @video.id
            @return_data['title'] = @video.title
            @return_data['location'] = @video.location
            @return_data['featured'] = @video.featured
            @return_data['badges'] = @video.badges
            @return_data['short_description'] = @video.short_description
            @return_data['publish_status'] = @video.publish_status
            if !@video.videos.empty?

              if @video.videos[0].videosource == "Manual"

                @return_data['video_url'] = @video.videos[0].video_file_name
                @return_data['video_type'] = @video.videos[0].videosource
              else
                @return_data['video_url'] = @video.videos[0].youtube
                @return_data['video_type'] = @video.videos[0].videosource
              end
            else
              @return_data['video_url'] =""
              @return_data['video_type'] = ""
            end
            error!({:success_message => "Record found",:result => @return_data }, 300)
          else
            error!({:error_message => "Record Could not found"}, 422)
          end

          

        end
      end
    end
  end
end
