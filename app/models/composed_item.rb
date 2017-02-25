class ComposedItem < Item
  has_many :items, foreign_key: 'parent_id'

  validates :items, presence: true
end
