class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :training_posts, foreign_key: "customer_id"
  has_many :meal_posts, foreign_key: "customer_id"
  has_many :training_fav, dependent: :destroy
  has_many :meal_fav, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_one_attached :profile_image

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  #フォローする
  def follow(user)
    active_relationships.create(followed_id: user.id)
  end
  #フォロー解除
  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end
  #フォローしているか判別
  def following?(user)
    followings.include?(user)
  end

  #ゲストユーザー
  GUEST_CUSTOMER_EMAIL = "guest@example.com"
  def self.guest
    find_or_create_by!(email: GUEST_CUSTOMER_EMAIL, name: "ゲストユーザー") do |customer|
      customer.password = SecureRandom.urlsafe_base64
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
