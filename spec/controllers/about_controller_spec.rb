require 'rails_helper'

RSpec.describe AboutController, type: :controller do

  describe "GET #us" do
    it "returns http success" do
      get :us
      expect(response).to have_http_status(:success)
    end
  end

end
