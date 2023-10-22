class TrainingPost < ApplicationRecord
  belongs_to :customer, class_name: 'Customer'

  has_many :training_fav, dependent: :destroy
  has_many :training_comments, dependent: :destroy
  has_many :training_menus, dependent: :destroy
  has_many :training_tags, through: :training_menus
  accepts_nested_attributes_for :training_tags, reject_if: :all_blank, allow_destroy: true

  def favorited_by?(customer)
   training_fav.exists?(customer_id: customer.id)
  end

  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["title", "content"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["customer", "training_comments", "training_fav"]
  end

end
