class Adress < ApplicationRecord
  belongs_to :user

  validates :street, :country, :zipcode, :city, presence: true
end
