class Edition < ApplicationRecord
  has_many :items, class_name: 'Available'
  has_many :partners
end
