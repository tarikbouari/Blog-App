class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :likes_count

  def likes_count
    post.increment!(:likes_counter)
  end
end
