class Contents < ActiveRecord::Base


   # validates :title, :format => { :with => /\A[a-zA-Z]+\z/,
   #                               :message => "Title Only letters allowed" }

   # validates :short_description, :format => { :with => /\A[a-zA-Z]+\z/,
   #                                :message => "short_description Only letters allowed" }


   validates :title, :presence => { :message => "Title cannot be blank" }
   validates :location, :presence => { :message => "Location cannot be blank" }
   validates :featured, :presence => { :message => "Please select feature." }
   validates :badges, :presence => { :message => "Please select feature. Badge." }
   validates :short_description, :presence => { :message => "Short Description cannot be blank" }
   validates :content_type, :presence => { :message => "Please select a content type." }




  # has_many :category
  # has_many :photos
  attr_accessor :category_id
  attr_accessor :body

  attr_accessor :videosource
  attr_accessor :youtube
  # attr_accessor :videofile


  has_many :pictures, :dependent => :destroy
  has_many :videos, :dependent => :destroy
   # mount_uploaders :avatars

   # has_attached_file :avatars, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
   # validates_attachment_content_type :title, :content_type => /\Aimage\/.*\Z/

   # has_attached_file :title, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
   # validates_attachment_content_type :title, :content_type => /\Aimage\/.*\Z/

end
