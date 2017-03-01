class Partner < ApplicationRecord
  include TokenAuthenticatable

  devise

  belongs_to :edition
  has_many :associations
  has_many :clubs, through: :associations
  has_many :reservations

  validates :name, presence: true, uniqueness: true
end
