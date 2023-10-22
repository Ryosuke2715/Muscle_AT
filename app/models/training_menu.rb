class TrainingMenu < ApplicationRecord
  belongs_to :customer, class_name: 'Customer'
  belongs_to :training_tag
end
