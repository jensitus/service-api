require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:user) {create(:user)}
  let!(:users) {create_list(:user, 9)}
  let(:headers) {valid_headers}

  describe 'GET /index' do
    context 'when valid request' do
      before {get '/users/index', params: {}, headers: headers}

      it 'returns list of users' do
        expect(json).not_to be_empty
        expect(json.size).to eq(10)
      end
    end

  end

end