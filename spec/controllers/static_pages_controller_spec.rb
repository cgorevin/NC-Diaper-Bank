require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #collect" do
    it "returns http success" do
      get :collect
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #donate" do
    it "returns http success" do
      get :donate
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #support" do
    it "returns http success" do
      get :support
      expect(response).to have_http_status(:success)
    end
  end

end
