class Post < ApplicationRecord
  # validates :title, presence: true, length: { in: 1..250 }
  # validates :comments_counter, :likes_counter, comparison: { greater_than_or_equal_to: 0 },
  #                                              numericality: { only_integer: true }
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :posts_counter

  after_initialize :set_comments_and_likes_counter_default

  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true },
                                               comparison: { greater_than_or_equal_to: 0 }

  def set_comments_and_likes_counter_default
    self.comments_counter = 0 if comments_counter.nil?
    self.likes_counter = 0 if likes_counter.nil?
  end

  def posts_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def all_comments
    comments.all
  end
end
