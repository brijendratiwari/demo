# module API
module Railsapp
  module V1
    class Searchapi < Grape::API
      include Railsapp::V1::Defaults
      format :json
      resource :searchapi do

        desc "Return all search"
        get "", root: :search do
          error!({:error_message => "Please provide a valid search srting."}, 422)
        end

        desc "Return a search"
        params do
            [:query]
        end
        get ":query", root: "search" do

          # @search =  Contents.search do
          #    fulltext params[:q].to_s
          #    fields(:title)
          #    fields(:image_file_name)
          # end

          # @search =  Contents.search do
          #
          #   fulltext params[:q]
          #   with :title, params[:q].to_s
          # end

          # Contents.import
          @query = Array.new;

          @limit = 10;
          if params[:limit].present?
            @limit = params[:limit]
          end

          @page = 1;
          if params[:page].present?
            @page = params[:page]
          end

          @content_types = ['Video,Article,Gallery'];

          if params[:content_types].present?
            @content_types = params[:content_types]
          end

          # @search = Contents.where(["publish_status LIKE ?", "%#{params[:query]}%"],['content_type IN (?)', "%#{params[:content_types]}%"]).page(@page).per(@limit)

          @final_data = Array.new


          i = 0;

          @search.each do |val|
            @final_data[i] = val
            i = i + 1
          end
          error!({:success_message => "Record found",:result => @final_data }, 300)


        end
      end
    end
  end
end
