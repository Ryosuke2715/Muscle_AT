class MealPost < ApplicationRecord
  #has_many_attached :post_image
  belongs_to :customer, class_name: 'Customer'

  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true


end
