require 'rails_helper'

RSpec.describe PhotoController, type: :controller do

  describe "GET #update_status" do
    it "returns http success" do
      get :update_status
      expect(response).to have_http_status(:success)
    end
  end

end
