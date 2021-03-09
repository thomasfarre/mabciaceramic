class Adress < ApplicationRecord
  belongs_to :user

  validates :street, :country, :city, presence: true
  validates :zipcode, presence: true, length: { is: 5 }
  validates :name, presence: true, length: { maximum: 40 }
end
