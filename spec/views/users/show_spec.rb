require 'rails_helper'
RSpec.describe 'User show', type: :feature do
  before :each do
    @avatar_pic = 'https://unsplash.com/photos/F_-0BxGuVvo'
    @author = User.create(name: 'James',
                          photo: @avatar_pic,
                          bio: 'A mysterious man with an eye for valuable finds, Luthen Rael will go to great lengths
                          and traverse the galaxy to locate the pieces he needs to achieve his goals.')
    @post1 = Post.create(author: @author, title: 'Keep on fighting',
                         text: 'We are close to destroying the Death Star, all rebels come full out')
    @post2 = Post.create(author: @author, title: 'Keep on fighting 1', text: 'Thank you for your support 😊')
    @post3 = Post.create(author: @author, title: 'Keep on fighting 2',
                         text: 'Hello there Cassian, this Dero I am watching you')
    @post4 = Post.create(author: @author, title: 'Keep on fighting 3', text: 'Spend the credits wisely :|')
    visit user_path(@author)
  end
  it 'shows user name' do
    expect(page).to have_content(@author.name)
  end
  it 'shows user biography' do
    expect(page.body).to have_content(@author.bio)
  end
  it 'shows only the users recent 3 posts' do
    expect(page).to have_content(@post4.text)
    expect(page).to have_content(@post3.text)
    expect(page).to have_content(@post2.text)
    expect(page).not_to have_content(@post1.text)
  end
  it 'shows the user photo' do
    image = page.all('img')
    expect(image.size).to eq 1
  end
  it 'shows number of posts user has written' do
    expect(page.body).to include('Number of posts: 4')
  end
  it 'shows the See all posts button' do
    expect(page).to have_content('See All Posts')
  end
  it 'shows the New Post button' do
    expect(page).to have_content('New Post')
  end

  it 'redirects to show all user posts when the \'See all posts\' button is clicked' do
    click_link 'See All Posts'
    expect(current_path).to match user_posts_path(@author)
  end
  it 'redirects to post new page when a \'New post\' button is clicked' do
    click_link 'New Post'
    expect(current_path).to match new_user_post_path(@author)
  end
end
