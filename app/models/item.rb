class Item < ApplicationRecord
  before_destroy :not_referenced_by_any_cart_item

  has_many :cart_items
  has_many_attached :photos

  monetize :price_cents

  validates :title, :description, :category, :status, :price_cents, presence: true
  # validates :status, inclusion: { in: %w[available sold] }

  def available?
    status == 'available'
  end

  def sold?
    status == 'sold'
  end

  def self.used_category
    Item.all.map { |item| item.category }.uniq
  end

  private

  def not_referenced_by_any_cart_item
    unless cart_items.empty?
      errors.add(:base, "Cart items present")
      throw :abort
    end
  end
end
