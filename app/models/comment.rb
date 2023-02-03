class Comment < ApplicationRecord
  after_save :comments_counter
  after_destroy :comments_counter

  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def comments_counter
    post.increment!(:comments_counter)
  end
end
