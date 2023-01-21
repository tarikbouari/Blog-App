class User < ApplicationRecord
  validates :name, presence: true,  comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
  has_many :posts
  has_many :comments
  has_many :likes

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
