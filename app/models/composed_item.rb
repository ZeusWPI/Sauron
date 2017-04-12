class ComposedItem < Item
  has_many :items, foreign_key: 'parent_id'
  validates_associated :items

  accepts_nested_attributes_for :items
end
