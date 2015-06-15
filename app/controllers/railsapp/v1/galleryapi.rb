# module Artical
module Railsapp
  module V1
    class Galleryapi < Grape::API
      include Railsapp::V1::Defaults

      resource :galleryapi do
        desc "Return all Gallery Images"

        get "", root: :gallerys do
            error!({:error_message => "Please provide a article id."}, 422)
        end

        desc "Return a acticle"

        params do
          requires :id, type: Integer, desc: "ID of the Gallery"
        end

        get ":id", root: "photo" do

          @Gallery = Contents.where(id: params[:id],content_type: 'Gallery').first

          if @Gallery.present?

            @return_data =  Hash.new

            @return_data['id'] = @Gallery.id
            @return_data['title'] = @Gallery.title
            @return_data['location'] = @Gallery.location
            @return_data['featured'] = @Gallery.featured
            @return_data['badges'] = @Gallery.badges
            @return_data['short_description'] = @Gallery.short_description
            @return_data['publish_status'] = @Gallery.publish_status
            if !@Gallery.pictures.empty?
              i  = 0;
              @return_data['image_list'] = Hash.new
              @Gallery.pictures.each do |image|
# eturn_data['body'] = @Artical.pictures[0].description
                byebug
                @return_data['image_list'][i] = image.image_file_name
                i = i + 1
              end
            else
              @return_data['image_list'][] =  "";
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