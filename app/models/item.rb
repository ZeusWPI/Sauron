class Item < ApplicationRecord
  include Prizable

  belongs_to :parent, optional: true, class_name: 'ComposedItem'

  validates :name, presence: true, uniqueness: true
end
