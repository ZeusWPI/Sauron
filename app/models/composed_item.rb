class ComposedItem < Item
  has_many :items, foreign_key: 'parent_id'
end
