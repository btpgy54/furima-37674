require 'rails_helper'

RSpec.describe "Rails", type: :request do

  describe "GET /d" do
    it "returns http success" do
      get "/rails/d"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /controller" do
    it "returns http success" do
      get "/rails/controller"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destinations" do
    it "returns http success" do
      get "/rails/destinations"
      expect(response).to have_http_status(:success)
    end
  end

end
