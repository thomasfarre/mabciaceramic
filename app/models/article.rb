class Article < ApplicationRecord
  has_rich_text :rich_body

  validates :title, presence: true
  has_one_attached :photo
end
