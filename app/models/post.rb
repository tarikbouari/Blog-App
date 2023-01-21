class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  after_save :posts_count

  def posts_count
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end