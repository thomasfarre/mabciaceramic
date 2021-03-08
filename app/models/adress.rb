class Adress < ApplicationRecord
  belongs_to :user

  validates :street, :country, :zipcode, :city, :name, presence: true
end
