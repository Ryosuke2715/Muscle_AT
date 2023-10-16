class TrainingPost < ApplicationRecord
  belongs_to :customer, class_name: 'Customer'

  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true

end
