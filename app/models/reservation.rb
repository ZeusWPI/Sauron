class Reservation < ApplicationRecord
  before_save :update_status

  belongs_to :partner
  belongs_to :item, class_name: 'Available', foreign_key: 'available_id'

  enum status: %w(pending approved rejected)

  validates :item, uniqueness: { scope: :partner }

  private

  def update_status
    self.status = :pending if reserved_count_changed?
  end
end
