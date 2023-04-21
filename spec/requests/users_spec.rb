require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns a success response' do
      get users_url
      expect(response).to be_successful
      expect(response.body).to include('Here is a list of Users')
      expect(response).to render_template(:index)
    end
  end

  describe 'users#show' do
    it 'show for users works!' do
      get '/users/:id'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('User profile')
      expect(response).to render_template(:show)
    end
  end
end
