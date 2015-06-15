class Category < ActiveRecord::Base
  validates :category, :presence => { :message => "Category cannot be blank" }
end
