class Video < ActiveRecord::Base
  belongs_to :contents

  has_attached_file :video,
                    :path => ":rails_root/public/video/:id/:filename",
                    :url  => "/video/:id/:filename"

  do_not_validate_attachment_file_type :video

end
