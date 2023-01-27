class User < ApplicationRecord
  # validates :name, presence: true
  # validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
 
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def all_posts
    posts.order(created_at: :desc)
  end
end
