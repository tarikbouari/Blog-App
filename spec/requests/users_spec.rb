require 'rails_helper'

# RSpec.describe UsersController, type: :request do
#   describe 'GET #index' do
#     it 'sould test the response' do
#       # another way for getting the route is get users_path
#       get '/users'
#       expect(response).to have_http_status(:success)
#       expect(response).to render_template(:index)
#       expect(response.body).to include('Here is a list of Users')
#     end
#   end

#   describe 'GET #show' do
#     it 'sould test the response for show' do
#       # another way for getting the route is get users_path
#       get '/users/:id'
#       expect(response).to have_http_status(:success)
#       expect(response).to render_template(:show)
#       expect(response.body).to include('This is the user')
#     end
#   end
# end
RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
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
