class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :training_posts, foreign_key: "customer_id"
  has_many :meal_posts, foreign_key: "customer_id"
  has_many :training_fav, dependent: :destroy
  has_many :meal_fav, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true


GUEST_CUSTOMER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_CUSTOMER_EMAIL) do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "ゲストユーザー"
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
