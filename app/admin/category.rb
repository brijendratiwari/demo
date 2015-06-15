ActiveAdmin.register Category do
menu false
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


  filter :category
  filter :status


  permit_params :id, :category,:status

  index do
    column 'ID',:id

    column :category
    column "# of Posts"  do |post|
      CategoryContentRelation.count(:conditions => "category_id = " + post.id.to_s)
    end
    #column :status

    column  'STATUS',:Status, label: 'Action'  do |post|
      link_to (post.status== 'Published' ? 'PUBLISHED' : 'UNPUBLISHED' ) , update_category_status_path(post) ,:class => (post.status== 'Published' ? 'PUBLISHED' : 'UNPUBLISHED' )
    end
  end


  form do |f|
    f.inputs "category" do
      f.input :category
      f.input :status,as:  'hidden',:input_html => { :value => f.object.status.present? ?  f.object.status : 'Unpulished' }
      f.input :featured,as: 'hidden',:input_html => { :value => f.object.featured.present? ? f.object.featured : 'no' }
      f.submit
    end
  end


end
