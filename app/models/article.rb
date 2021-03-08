class Article < ApplicationRecord
  has_rich_text :rich_body

  has_one_attached :photo

  validates :title, presence: true
end
