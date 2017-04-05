class Reservation < ApplicationRecord
  before_save :update_status

  belongs_to :partner
  belongs_to :item, class_name: 'Available', foreign_key: 'available_id'
  has_many :actions

  enum status: %w(pending approved rejected)

  validates :item, uniqueness: { scope: :partner }

  def update_picked_up_count!
    parent = item.parent

    if parent
      a = parent.availables.where(edition: item.edition).first
      reservation = a.reservations.where(partner: partner).first
      parent_picked_up = reservation.try(:picked_up) || 0
    end

    update picked_up_count: picked_up + parent_picked_up
  end

  def picked_up
    actions.sum(:amount)
  end

  private

  def update_status
    self.status = :pending if reserved_count_changed?
  end
end
