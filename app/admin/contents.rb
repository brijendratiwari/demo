ActiveAdmin.register Contents do

  menu priority: 4
# See permitted parameters documentation:
# https://github.com/activeadmin.js/activeadmin.js/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  filter :title
  filter :location
  filter :content_type
  filter :featured
  filter :publish_status

# Index Table
  action_item :view_site do
    link_to "Manage Category", admin_categories_path
  end

  index do

    selectable_column
    column 'ID',:id
    column 'TITLE',:title
    column 'LOCATION',:location
    column 'CONTENT TYPE',:content_type
    column 'FEATURED',:action  do |post|
      link_to (post.featured == 'true'  ? 'YES' : 'NO' ) , update_content_feature_path(post),:class => (post.featured == 'true' ? 'PUBLISHED' : 'UNPUBLISHED' )
    end
    column 'STATUS',:publish_status  do |post|
      link_to (post.publish_status== 'Published' ? 'PUBLISHED' : 'UNPUBLISHED' ) ,  update_content_status_path(post) ,:class => (post.publish_status== 'Published' ? 'PUBLISHED' : 'UNPUBLISHED' )
    end
  end
# Batch Operation

  batch_action :publish do |ids|
    Contents.find(ids).each do |post|
      post.publish_status= 'Published'
      post.save
    end
    redirect_to collection_path, alert: "The photos have been published."
  end
  batch_action :unpublish do |ids|
    Contents.find(ids).each do |post|
      post.publish_status= 'Unpublished'
      post.save
    end
    redirect_to collection_path, alert: "The photos have been unpublished."
  end

# Add Form

  form :url => :content_save ,:html => { :enctype => "multipart/form-data" ,:validate => true} do |f|


    f.inputs "contents" do



      f.input :title, label: 'Title', :input_html =>{ :required => ''}
      li do
        f.label :location
        f.select :location, options_for_select([['Community', 'Community'], ['Learn More', 'Learn More']]), :prompt => "Select Location"
      end
      li do
        f.label :Type
        f.select :content_type, options_for_select([['Article', 'Article'], ['Gallery', 'Gallery'], ['Video', 'Video']]), :prompt => "Select Type", :id => 'content_type'
      end
      # f.input :content_type, label: 'Content Type'
      f.input :featured, label: 'Featured', as: 'radio'

      li do
        f.label :Badge
        div :class => "checkbox" do
          #f.check_box :badges, :value => 'Hot', :multiple => true, :style => 'Float:left'
          f.check_box :badges, { :multiple => true,:style => 'Float:left'}, "Hot", ""
          f.label :Hot
        end
        div :class => "checkbox" do
          #f.check_box :badges, :value => :'New', :multiple => true, :style => 'Float:left'
          f.check_box :badges, { :multiple => true,:style => 'Float:left'}, "New", ""
          f.label :New
        end
        div :class => "checkbox" do
          #f.check_box :badges, :value => :'Sexy', :multiple => true, :style => 'Float:left'
          f.check_box :badges, { :multiple => true,:style => 'Float:left'}, "Sexy", ""
          f.label :New
        end
        div :class => "checkbox" do
          #f.check_box :badges, :value => :'Must See', :multiple => true, :style => 'Float:left'
          f.check_box :badges, { :multiple => true,:style => 'Float:left'}, "Must see", ""
          f.label :MustSee
        end
      end

      li :class => "clear" do
        f.label :category
        f.collection_select(:category_id, Category.all, :id, :category, {:prompt => "Select category"}, {:multiple => true})
      end

      li :class => "short-desc" do
        f.label :short_description
        f.text_area :short_description,:class => "redactor", :rows => 40, :cols => 120, label: "Short Description"
      end

        li :class => "article"  do
          f.label :Body
        f.text_area :body,{:class => 'body_textarea redactor'}
        end


         f.input :images, :as => :file, :input_html =>{:accept => "image/*",:class => "article gallery"}


      li :class => "video" do
        f.label :"Video Source"
        f.select :videosource, options_for_select([['YouTube', 'YouTube'], ['Manual Upload', 'Manual Upload']]), :prompt => "Select Video Source", :id => 'video_source'
      end

      f.input :youtube, label: 'Youtube Video ID', :input_html =>{ :required => '',:class => "YouTube"}

      f.input :video, :as => :file, :input_html =>{:accept => "video/*",:class => "Manual"}

      li :class => "clear" do f.submit 'Submit' end
    end

  end

end
