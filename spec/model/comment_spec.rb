require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) { Comment.create(user_id: 1, post_id: 1, text: 'comment') }

  it 'should have a user id' do
    comment.user_id = 1
    expect(comment).to_not be_valid
  end

  it 'should have a post id' do
    comment.post_id = nil
    expect(comment).to_not be_valid
  end

  it 'should have a same text' do
    expect(comment.text).to eq('comment')
  end
end
