class Club < ApplicationRecord
  has_many :associations
  has_many :partners, through: :associations
end
