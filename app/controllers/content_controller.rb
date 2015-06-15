class ContentController < ApplicationController
  def save


    @data = params['contents']

    if @data['content_type'] == 'Video'
      @content_data = Contents.new(video_params)
    else
      @content_data = Contents.new(gallery_params)
    end

    if @data['featured'] == "true"
      Contents.where(:id =>  @id).update_all(featured: 'false')
    end

        @temp_arr = Array.new
    i = 0

    @data['badges'].each do |val|

      if val != ''
        @temp_arr[i] = val
        i = i + 1
      end

    end

    @content_data.badges = @temp_arr.join(',')

    @content_data.publish_status = 'Unpublished'



    if @content_data.save
      @data['category_id'].each do
        @cat_val

        if @cat_val != ""
          @save_rel = CategoryContentRelation.new()
          @save_rel.category_id = @data['category_id']
          @save_rel.content_id = @cat_val

          @save_rel.save
        end
      end

      if params[:contents][:content_type] == 'Article'

        if params[:contents][:images]
          # The magic is here ;)
          # params[:contents][:images].each { |image|
          @content_data.pictures.create(image: params[:contents][:images], description: params[:contents][:body])
          # }
        end
      elsif params[:contents][:content_type] == 'Gallery'
        if params[:contents][:images]
          params[:contents][:images].each do |image|

            @content_data.pictures.create(image: image, description: params[:contents][:body])
          end
        end
      elsif params[:contents][:content_type] == 'Video'
        if params[:contents][:videosource] != 'YouTube'
          @content_data.videos.create(video: params[:contents][:video], videosource: 'Manual')
        else
          @content_data.videos.create(youtube: params[:contents][:youtube], videosource: 'Youtube')
        end

      end

      redirect_to new_admin_content_path, alert: "Content has beed created successfully."
      # format.html { redirect_to @content_data, notice: 'Gallery was successfully created.' }
      # format.json { render json: @content_data, status: :created, location: @gallery }
    else

      @error_message = ""
      error_arr = Array.new
      i = 0
      @content_data.errors.messages.each do |key, val|
        error_arr[i] = val[0]
        i = i + 1
      end
      @error_message = error_arr.join('<br />').html_safe

      redirect_to new_admin_content_path, :flash => {:error => @error_message}

    end

  end

  def update_content_feature

    @id = params['id']

    @featured = Contents.find(@id).featured
    @title = Contents.find(@id).title

    if  @featured == "true"
      Contents.where(:id =>  @id).update_all(featured: 'false')
    else

      Contents.update_all(featured: 'false')
      Contents.where(:id =>  @id).update_all(featured: 'true')
    end

    redirect_to  admin_contents_path, alert: "The "+ @title +" feature changed successfully."
  end

  def update_content_status

    @id = params['id']

    @status = Contents.find(@id).publish_status
    @title = Contents.find(@id).title

    if  @status == "Published"
      @status_value = "Unpublished"
    else
      @status_value = "Published"
    end

    Contents.where(:id =>  @id).update_all(publish_status: @status_value)

    redirect_to  admin_contents_path, alert: "The "+ @title +" have been "+@status_value + " ."

  end

  # redirect_to new_admin_content_path, alert: "The photo have been if"


  #
  # # @content_data.title = @data['title']
  # @content_data.location = @data['location']
  # @content_data.content_type = @data['content_type']
  #
  # if @data['featured']
  #   @content_data.featured = "yes"
  # else
  #   @content_data.featured = "no"
  # end
  # @content_data.badges = @data['badges']
  #
  # @content_data.location = @data['location']
  # @content_data.short_description = @data['short_description']
  #
  # @content_data.title = @data[:title]
  #
  # if @content_data.save
  #   @id = @content_data.id
  #
  #   @rel_data = [{:content_id => @id},{:category_id=>@data['category_id']}]
  #
  #   @save_rel = CategoryContentRelation.new()
  #
  #   @save_rel.category_id = @data['category_id']
  #   @save_rel.content_id = @id
  #
  #   if @save_rel.save
  #
  #   end
  #
  #   redirect_to  new_admin_content_path, alert: "The photo have been if"
  # else
  #
  #   @error_message = ""
  #   error_arr = Array.new
  #    i = 0
  #   @content_data.errors.messages.each do | key, val|
  #     error_arr[i] = val[0]
  #     i = i + 1
  #   end
  #   @error_message = error_arr.join('<br />').html_safe
  #
  #   redirect_to  new_admin_content_path, :flash => { :error => @error_message}

  # end
  # end


  private

  def gallery_params
    params.require(:contents).permit(:title, :location, :featured, :badges, :short_description, :content_type,:publish_status, :pictures)
  end

  def video_params
    params.require(:contents).permit(:title, :location, :featured, :badges, :short_description, :content_type,:publish_status, :videos)
  end
end
