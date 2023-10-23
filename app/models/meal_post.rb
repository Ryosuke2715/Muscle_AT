class MealPost < ApplicationRecord
  #has_many_attached :post_image
  belongs_to :customer, class_name: 'Customer'

  has_many :meal_fav, dependent: :destroy
  has_many :meal_comments, dependent: :destroy

  def favorited_by?(customer)
   meal_fav.exists?(customer_id: customer.id)
  end

  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true


  def self.ransackable_attributes(auth_object = nil)
    ["title", "content"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["customer", "meal_comments", "meal_fav"]
  end


end
