class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :deadline, presence: true
end
