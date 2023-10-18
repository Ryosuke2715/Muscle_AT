class TrainingPost < ApplicationRecord
  belongs_to :customer, class_name: 'Customer'

  has_many :training_fav, dependent: :destroy
  has_many :training_comments, dependent: :destroy

  def favorited_by?(customer)
   training_fav.exists?(customer_id: customer.id)
  end

  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true

end
