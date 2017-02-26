class Item < ApplicationRecord
  include Prizable

  belongs_to :parent, optional: true, class_name: 'ComposedItem'
  belongs_to :category

  validates :name, presence: true, uniqueness: true
end
