require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:user) { create(:user) }
  let!(:users) { create_list(:user, 9) }
  let(:headers) { valid_headers }
  let(:user_id) { users.first.id }

  describe 'GET /index' do
    context 'when valid request' do
      before {get '/users/index', params: {}, headers: headers}
      it 'returns list of users' do
        puts json.inspect
        expect(json).not_to be_empty
        expect(json.size).to eq(10)
      end
    end
  end

  describe 'GET /users/:id' do
    context 'when valid request' do
      before {get "/users/#{user_id}", params: {}, headers: headers}
      it 'returns single user' do
        # expect(json).not_to be_empty
        # expect(json['id']).to eq(user_id)
        puts json.inspect
        expect(response).to have_http_status(200)
      end
    end
  end

end