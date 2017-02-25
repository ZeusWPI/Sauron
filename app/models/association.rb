class Association < ApplicationRecord
  belongs_to :partner
  belongs_to :club

  validates :club, uniqueness: { scope: :partner }
end
