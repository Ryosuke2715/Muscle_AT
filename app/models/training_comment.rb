class TrainingComment < ApplicationRecord
  belongs_to :customer
  belongs_to :training_post

  validates :comment_content, presence: true
end
