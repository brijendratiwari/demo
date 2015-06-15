module Railsapp
  class Base < Grape::API
    mount Railsapp::V1::Base
  end
end


