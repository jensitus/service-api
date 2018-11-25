require 'rails_helper'
RSpec.describe 'Password Reset API', type: :request do
  let!(:user) {create(:user)}
  let(:headers) {valid_headers}
  let(:pw_id) {1}
  let(:valid_params) do
    { email: user.email }.to_json
  end
  let(:edit_params) do
    {
        email: user.email,
        token: user.reset_token
    }.to_json
  end

  describe "POST #create" do
    context "when valid request" do
      before {post "/password_resets", params: valid_params, headers: headers}
      it "returns reset_token" do
        expect(json['message']).to match(/We've sent you an email with instructions how to reset your password, check your mail!/)
      end
    end
  end

  describe "GET #new" do
    context "when valid request" do
      before {get "/password_resets/new", params: {}, headers: headers}
      it "returns http success" do
        expect(json['message']).to match(/yes/)
      end
    end
  end

  describe "GET #edit" do
    context "when valid request" do
      # before {get "/password_resets/#{token}/edit", params: edit_params, headers: headers}
      # it "returns http success" do
      #   # puts edit_params.inspect
      # end
    end
  end

end
