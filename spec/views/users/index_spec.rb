require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature do
  # pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @first_user = User.create(name: 'david ferra', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Ruby developer from congo')
    @second_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.')
    @third_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Poland.')
    @first_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my first post')
    @second_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my first post')
    Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom!')
    Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom!')
    Like.create(post: @first_post, author: @first_user)

    @users = User.all
  end
  it 'user index shows all the user names' do
    visit users_path
    @users.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  it 'Shows the image of all users' do
    visit users_path
    @users.each do |user|
      expect(page).to have_css("img[src*='#{user.photo}']")
    end
  end

  it 'Shows the text \'Number of posts\' for all users' do
    visit users_path
    @users.each do |_user|
      expect(page).to have_content('Number of posts:')
    end
  end

  it 'Shows the posts_counter of all users' do
    visit users_path
    @users.each do |user|
      expect(page).to have_content(user.posts_counter)
    end
  end

  it 'Redirects to user\'s show page' do
    visit users_path
    click_link @first_user.name
    expect(current_path).to match user_path(@first_user)
  end
end
