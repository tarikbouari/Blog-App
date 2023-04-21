require 'rails_helper'

RSpec.describe Like, type: :model do
  subject(:like) { Like.create(user_id: 1, post_id: 1) }

  it 'should have a user id' do
    like.user_id = nil
    expect(like).to_not be_valid
  end

  it 'should have a post id' do
    like.post_id = nil
    expect(like).to_not be_valid
  end
end
