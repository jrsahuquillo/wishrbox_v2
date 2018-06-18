require 'rails_helper'

RSpec.describe WishesController, type: :controller do

  before do
    @sahu = User.create!(email: 'sahu@mail.com', password: 'password')
  end

  describe "GET #index" do
    it "returns http success" do
      sign_in @sahu
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
