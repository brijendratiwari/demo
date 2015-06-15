# # module API
# module Railsapp
#   module V1
#     class Photos < Grape::API
#       include Railsapp::V1::Defaults
#
#       resource :photos do
#         desc "Return all photos"
#         get "", root: :photos do
#           # byebug
#           Photos.all
#         end
#
#         desc "Return a photo"
#         params do
#           requires :id, type: String, desc: "ID of the photo"
#         end
#         get ":id", root: "photo" do
#           # byebug
#           Photos.where(id: permitted_params[:id]).first!
#           # Photos.where(:id =>  @id).update_all(publish_status: @status_value)
#         end
#       end
#     end
#   end
# end
