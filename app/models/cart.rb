class Cart < ApplicationRecord
  belongs_to :user, optionnal: true
  has_many :cart_items
end
