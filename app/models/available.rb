class Available < ApplicationRecord
  belongs_to :edition
  belongs_to :item

  delegate :description, :description=,
           :name, :name=,
           :price, :price=,
           to: :item

  scope :with_data, -> { includes(:item) }

  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
