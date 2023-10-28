class TrainingFav < ApplicationRecord
  belongs_to :customer
  belongs_to :training_post
end
