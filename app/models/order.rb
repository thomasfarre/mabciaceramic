class Order < ApplicationRecord
  belongs_to :cart, optional: true

  belongs_to :user
  monetize :amount_cents

  validates :status, inclusion: { in: ['paid', 'checked', 'envoyé', 'reçu', nil] }

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
