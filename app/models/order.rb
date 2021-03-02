class Order < ApplicationRecord
  belongs_to :cart, optional: true

  belongs_to :user
  monetize :amount_cents

  validates :status, inclusion: { in: ['paid', 'checked', 'envoyé', nil] }

  def paid?
    status == 'paid'
  end

  def envoyé?
    status == 'envoyé'
  end
end
