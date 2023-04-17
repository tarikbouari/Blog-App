require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  before :each do
    @pic = 'https://unsplash.com/photos/F_-0BxGuVvo'
    @author = User.create(name: 'Cassian Andor',
                          photo: @pic,
                          bio: 'Rebel fighter from Kenari.An accomplished Alliance Intelligence officer
                          with combat field experience.')
    @first_post = Post.create(author: @author, title: 'Selam from', text: 'This is my first post')
    @second_post = Post.create(author: @author, title: 'Hello there!',
                               text: 'This is james')

    @comment = Comment.create(author: @author, post: @second_post, text: 'Thank you')

    visit user_posts_path(@author)
  end

  it 'shows the username of the user' do
    expect(page).to have_content(@author.name)
  end
  it 'shows the user photo' do
    expect(page.body).to include(@pic)
  end

  it 'shows number of posts user has written' do
    expect(page.body).to include('Number of posts: 2')
  end

  it 'shows number of comments a post has' do
    expect(page.body).to include('Comments: 1')
  end

  it 'shows number of likes a post has' do
    expect(page.body).to include('Likes: 0')
  end

  it 'shows the title of the post' do
    expect(page).to have_content(@second_post.title)
  end

  
end
