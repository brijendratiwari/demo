# module Artical
module Railsapp
  module V1
    class Articleapi < Grape::API
      include Railsapp::V1::Defaults

      resource :articleapi do
        desc "Return all article"

        get "", root: :articles do
            error!({:error_message => "Please provide a article id."}, 422)
        end

        desc "Return a acticle"

        params do
          requires :id, type: Integer, desc: "ID of the photo"
        end

        get ":id", root: "photo" do

          @Artical = Contents.where(id: params[:id],content_type: 'Article').first

          if @Artical.present?

            @return_data =  Hash.new

            @return_data['id'] = @Artical.id
            @return_data['title'] = @Artical.title
            @return_data['location'] = @Artical.location
            @return_data['featured'] = @Artical.featured
            @return_data['badges'] = @Artical.badges
            @return_data['short_description'] = @Artical.short_description
            @return_data['publish_status'] = @Artical.publish_status
            if !@Artical.pictures.empty?
              @return_data['body'] = @Artical.pictures[0].description
              @return_data['image_url'] = @Artical.pictures[0].image_file_name

            else

              @return_data['body'] = ""
              @return_data['image_url'] = ""
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