class User < ApplicationRecord
  after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart
  has_one_attached :photo
  has_many :adresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :first_name, :last_name, presence: true, length: { minimum: 2, maximum: 25 }

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def profil_pic
    photo.attached? ? photo.key : 'https://res.cloudinary.com/dbdoadukm/image/upload/v1616515719/photo-1583818412016-5596e47a618a_qishcy.jpg'
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_later
  end
end
