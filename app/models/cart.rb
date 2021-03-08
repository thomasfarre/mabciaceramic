class Cart < ApplicationRecord
  extend FriendlyId
  friendly_id :hashid, use: :slugged

  before_validation :set_hashid, prepend: true, if: Proc.new { |cart| cart.hashid.nil? }

  has_one :order, dependent: :nullify
  has_many :cart_items, dependent: :destroy

  belongs_to :user, optional: true

  def add_item(item)
    current_item = cart_items.find_by(item_id: item.id)

    if current_item ||= current_item

      # put this to implement quantity

      # current_item.increment(:quantity)
    else
      current_item = cart_items.build(item_id: item.id)
    end
    current_item
  end

  def total_price
    cart_items.to_a.sum { |item| item.total_price }
  end

  private

  def set_hashid
    self.hashid = SecureRandom.urlsafe_base64(6)
  end
end
