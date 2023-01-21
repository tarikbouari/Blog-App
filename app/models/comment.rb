class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :comments_counter

  def comments_counter
    post.increment!(:comments_counter)
  end
end
