class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post

  after_save :comments_count

  def comments_count
    post.increment!(:comments_counter)
  end
end
