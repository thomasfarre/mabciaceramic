class Item < ApplicationRecord
  before_destroy :not_referenced_by_any_cart_item

  has_many :cart_items
  has_many_attached :photos

  monetize :price_cents
  validates :title, :description, :status, presence: true
  validates :status, inclusion: { in: ['pending', 'transit', 'removed'] }

  def pending?
    status == 'pending'
  end

  def transit?
    status == 'transit'
  end

  def removed?
    status == 'removed'
  end

  private

  def not_referenced_by_any_cart_item
    unless cart_items.empty?
      errors.add(:base, "Cart items present")
      throw :abort
    end
  end

end
