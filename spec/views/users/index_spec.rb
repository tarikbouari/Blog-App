require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  before :each do
    @avatar_pic = 'https://unsplash.com/photos/F_-0BxGuVvo'
    @author = User.create(name: 'Cassian Andor',
                          photo: @avatar_pic,
                          bio: 'Rebel fighter from Kenari.An accomplished Alliance Intelligente',
                          posts_counter: 0)

    @post = Post.create(author: @author, title: 'Hello there!',
                        text: 'This is ObiWans\' message: Don\'t let the Empire win')

    visit root_path
  end

  it 'shows the username of the user' do
    expect(page).to have_content(@author.name)
  end

  it 'contains users pic' do
    expect(page).to have_css("img[src='#{@avatar_pic}']")
  end

  it 'Count user post' do
    expect(page.body).to include('Number of posts: 1')
  end

  it 'Directed to show user page' do
    click_link @author.name
    expect(page).to have_current_path(user_path(@author))
  end
end
