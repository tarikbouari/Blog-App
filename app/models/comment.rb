class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :posts

  after_save :comments_count

  def comments_count
    post.increment!(:comments_counter)
  end
end
