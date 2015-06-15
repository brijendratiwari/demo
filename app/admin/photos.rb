ActiveAdmin.register Photos do
  # menu parent: 'Components'

  menu false
  # menu label: "Instagram feed"
# See permitted parameters documentation:
# https://github.com/activeadmin.js/activeadmin.js/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  permit_params :id, :instagram_photo_id, :url, :user_id, :publish_status, :created_at, :updated_at

  actions :all, :except => [:new]

  action_item :view_site do
    link_to "Import photos", '/session/connect'
  end

  # actions :add

  index do

    selectable_column
    column :id
    column "Image" do |post|
      image_tag post.url, style: 'width:100px'
    end
    column :url
    #column :status
    column :publish_status, label: 'on'
    column :action, label: 'Action'  do |post|
      link_to (post.publish_status== 'Published' ? 'Unpublished' : 'Published' ) , update_status_path(post)
    end
  end

  batch_action :publish do |ids|
    Photos.find(ids).each do |post|
      post.publish_status= 'Published'
      post.save
    end
    redirect_to collection_path, alert: "The photos have been published."
  end
  batch_action :unpublish do |ids|
    Photos.find(ids).each do |post|
      post.publish_status= 'Unpublished'
      post.save
    end
    redirect_to collection_path, alert: "The photos have been unpublished."
  end


end
