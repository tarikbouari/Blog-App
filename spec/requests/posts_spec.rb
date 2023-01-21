require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    it 'sould test the response' do
      # another way for getting the route is get users_path
      get '/users/user_id/posts'
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include('list of Post')
    end
  end

  describe 'GET #show' do
    it 'sould test the response for show' do
      get '/users/user_id/posts/:id'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('Post profile')
    end
  end
end
