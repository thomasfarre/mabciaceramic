class Order < ApplicationRecord
  belongs_to :cart, optional: true

  belongs_to :user
  monetize :amount_cents

  validates :status, inclusion: { in: ['checked', 'paid', 'envoyé', 'reçu', 'new'] }

  def paid?
    status == 'paid'
  end

  def envoyé?
    status == 'envoyé'
  end

  def reçu?
    status == 'reçu'
  end
end
