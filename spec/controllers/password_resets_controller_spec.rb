require 'rails_helper'

RSpec.describe PasswordResetsController, type: :controller do

  let!(:user) { create(:user) }
  let(:headers) { valid_headers }
  let(:pw_id) { 1 }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      puts response.body
      puts json
      expect(response).to have_http_status(422)
      expect(json['message']).to match(/Missing token/)
    end
  end

end
