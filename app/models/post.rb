class Post < ApplicationRecord
    validates :title, presence: true, length: { in: 1..250 }
    validates :comments_counter, :likes_counter, comparison: { greater_than_or_equal_to: 0 },
                                                 numericality: { only_integer: true }
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :posts_counter

  def posts_counter
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
