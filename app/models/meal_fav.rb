class MealFav < ApplicationRecord
  belongs_to :customer
  belongs_to :meal_post
end
