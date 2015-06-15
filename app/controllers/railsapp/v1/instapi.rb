# module API
module Railsapp
  module V1
    class Instapi < Grape::API
      include Railsapp::V1::Defaults

      resource :instapi do
        desc "Return all photos"
        get "", root: :photos do

          @Photos =  Photos.where(publish_status: 'Published')

          if @Photos.present?
            error!({:success_message => "Record found",:result => @Photos ,:count => @Photos.count}, 300)
          else
            error!({:error_message => "Record Could not found"}, 422)
          end
        end

        desc "Return a photo"
        params do
          requires :id, type: String, desc: "ID of the photo"
        end
        get ":id", root: "photo" do
          # byebug
          @Photos = Photos.where(id: permitted_params[:id]).first

          if @Photos.present?
            error!({:success_message => "Record found",:result => @Photos }, 300)
          else
            error!({:error_message => "Record Could not found"}, 422)
          end
          # Photos.where(:id =>  @id).update_all(publish_status: @status_value)
        end
      end
    end
  end
end
