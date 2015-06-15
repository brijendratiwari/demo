class PhotoController < ApplicationController
  def update_status
    @id = params['id']

   @status = Photos.find(@id).publish_status

   @status_value = "";

   if  @status == "Published"
     @status_value = "Unpublished"
   else
     @status_value = "Published"
   end


     Photos.where(:id =>  @id).update_all(publish_status: @status_value)
   # render :text => @id

     redirect_to  admin_photos_path, alert: "The photo have been "+@status_value
  end
end
