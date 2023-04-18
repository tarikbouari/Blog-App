require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  before :each do
    @avatar_pic = 'https://whatsondisneyplus.com/wp-content/uploads/2022/09/andor-avatar.png'
    @author = User.create(name: 'Cassian Andor',
                          photo: @avatar_pic,
                          bio: 'Rebel fighter from Kenari.An accomplished Alliance Intelligence officer with
                          combat field experience.')
    @post = Post.create(author: @author, title: 'Hello there!',
                        text: 'This is ObiWans\' message: Don\'t let the Empire win')

    @com1 = Comment.create(author: @author, post: @post, text: 'Thank you for your support')
    @com2 = Comment.create(author: @author, post: @post, text: 'Hello there Cassian, this Dero I am watching you')
    @com3 = Comment.create(author: @author, post: @post, text: 'Spend the credits wisely ')
    @com4 = Comment.create(author: @author, post: @post, text: 'This is the fourth comments ')
    @com5 = Comment.create(author: @author, post: @post, text: 'This is the fith comments ')

    @like1 = @post.likes.create!(author: @author)

    visit user_post_path(@author, @post)
  end

  it 'shows the username of the user' do
    expect(page).to have_content(@author.name)
  end

  it 'shows number of comments the post has' do
    expect(page.body).to include('Comments: 5')
  end

  it 'shows number of likes a post has' do
    expect(page.body).to include('Likes: 1')
  end
 
end
