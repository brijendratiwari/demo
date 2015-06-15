require "grape-swagger"

# module API
module Railsapp
  module V1

    class Base < Grape::API
      #mount Railsapp::V1::Photos

      mount Railsapp::V1::Instapi
      mount Railsapp::V1::Videoapi
      mount Railsapp::V1::Articleapi
      mount Railsapp::V1::Galleryapi
      mount Railsapp::V1::Searchapi

      # mount API::V1::AnotherResource

      add_swagger_documentation(
          api_version: "v1",
          hide_documentation_path: true,
          mount_path: "/api/v1/swagger_doc",
          hide_format: true
      )
    end
  end
end