class CategoryContentRelation < ActiveRecord::Base
  belongs_to :contents
  # belongs_to :Category
end
