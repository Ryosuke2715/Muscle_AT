class TrainingTag < ApplicationRecord
  has_many :training_menu, dependent: :destroy
  has_many :training_posts, through: :training_menus
end
