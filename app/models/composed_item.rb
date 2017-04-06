class ComposedItem < Item
  has_many :items, foreign_key: 'parent_id'

  accepts_nested_attributes_for :items
end
