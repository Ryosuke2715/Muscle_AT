class MealComment < ApplicationRecord
  belongs_to :customer
  belongs_to :meal_post

  validates :comment_content, presence: true
end
