class CategoryController < ApplicationController

  def update_category_status

    @id = params['id']

    @status = Category.find(@id).status
    @name = Category.find(@id).category

    if  @status == "Published"
      @status_value = "Unpublished"
    else
      @status_value = "Published"
    end


    Category.where(:id =>  @id).update_all(status: @status_value)
    # render :text => @id

    redirect_to  admin_categories_path, alert: "The "+@name+" have been "+@status_value

  end

  def update_category_feature

      @id = params['id']

      @featured = Category.find(@id).featured
      @name = Category.find(@id).category

      if  @featured == "no"
        @featured_value = "yes"
      else
        @featured_value = "no"
      end

      Category.where(:id =>  @id).update_all(featured: @featured_value)
      # render :text => @id

      redirect_to  admin_categories_path, alert: "The "+@name+" feature changed successfully."

  end

end
