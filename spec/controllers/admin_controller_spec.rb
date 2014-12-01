require 'rails_helper'

RSpec.describe Admin::BaseAdminController, :type => :controller do

  describe "GET fillings" do
    xit "returns http success" do
      get :fillings
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET items" do
    xit "returns http success" do
      get :items
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET dashboard" do
    xit "returns http success" do
      get :dashboard
      expect(response).to have_http_status(:success)
    end
  end

end
