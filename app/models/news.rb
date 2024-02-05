class News < ApplicationRecord
  has_many :comments

  # validates :public_notes, presence: true
  # validates :news_id, presence: true
end
