class PhotosSerializer < ActiveModel::Serializer
  # attributes :id, :instagram_photo_id, :url, :user_id, :publish_status, :created_at, :updated_at
  attributes :id, :url,:publish_status, :discription, :created_at
end
