require 'rails_helper'

describe Api::ScoresController, type: :controller do
  before :each do
    user1 = create(:user, name: 'User1', email: 'user1@email.com', password: 'userpass')
    user2 = create(:user, name: 'User2', email: 'user2@email.com', password: 'userpass')
    sign_in(user1, scope: :user)

    create(:score, user: user1, total_score: 79, played_at: '2021-05-20')
    create(:score, user: user2, total_score: 99, played_at: '2021-06-20')
    create(:score, user: user2, total_score: 68, played_at: '2021-06-13')
  end

  describe 'GET feed' do
    it 'should return the token if valid username/password' do
      post :user_feed

      expect(response).to have_http_status(:ok)
      response_hash = JSON.parse(response.body)
      user_data = response_hash['scores']

      expect(user_data.size).to eq 3
      expect(user_data[0]['user_name']).to eq 'User2'
      expect(user_data[0]['total_score']).to eq 99
      expect(user_data[0]['played_at']).to eq '2021-06-20'
      expect(user_data[1]['total_score']).to eq 68
      expect(user_data[2]['total_score']).to eq 79
    end
  end
end
