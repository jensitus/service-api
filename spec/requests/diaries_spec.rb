require 'rails_helper'

RSpec.describe 'Diaries API', type: :request do
  let(:user) { create(:user) }
  let!(:diaries) { create_list(:diary, 20, user_id: user.id) }
  let(:headers) { valid_headers }
  let(:diary_id) {diaries.first.id}

  describe "GET #show" do
    before { get "/diaries/#{diary_id}/", params: {}, headers: headers }
    context 'when the record exists' do
      it 'returns the diary' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(diary_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "Get #index" do
    before { get "/diaries", params: {}, headers: headers }
    context 'when the record exists' do
      it 'returns the diary list' do
        puts json.inspect
        expect(json).not_to be_empty
      end
    end
  end

end
