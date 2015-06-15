class AddYoutubeToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :youtube, :string
    add_column :videos, :videosource, :string
  end
end
