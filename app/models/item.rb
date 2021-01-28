class Item < ApplicationRecord
  has_many :cart_items

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
end
