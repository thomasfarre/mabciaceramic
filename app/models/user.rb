class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :carts
  has_one_attached :photo

  validates :first_name, :last_name, presence: true, length: { minimum: 2, maximum: 25 }

  def name
    "#{first_name} #{last_name}"
  end

  def profil_pic
    photo.attached? ? photo.key : '1_W35QUSvGpcLuxPo3SRTH4w_lzy6tr'
  end
end
