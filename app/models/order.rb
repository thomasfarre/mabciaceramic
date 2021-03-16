class Order < ApplicationRecord
  belongs_to :cart

  belongs_to :user
  monetize :amount_cents

  validates :status, inclusion: { in: %w[new checked paid send received] }

  def paid?
    status == 'paid'
  end

  def send?
    status == 'send'
  end

  def received?
    status == 'received'
  end

  def new?
    status == 'new'
  end
end
