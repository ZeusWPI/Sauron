class Item < ApplicationRecord
  include Prizable, Barcodable

  belongs_to :parent, optional: true, class_name: 'ComposedItem'
  belongs_to :category
  has_many :availables

  validates :name, presence: true, uniqueness: true
end
