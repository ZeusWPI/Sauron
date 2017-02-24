class Partner < ApplicationRecord
  include TokenAuthenticatable

  devise

  belongs_to :edition

  validates :name, presence: true, uniqueness: true
end
