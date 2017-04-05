class Action < ApplicationRecord
  belongs_to :reservation

  after_create  :update_reservation!
  after_destroy :update_reservation!

  validates :amount, presence: true, numericality: { only_integer: true }

  private

  def update_reservation!
    reservation.update_picked_up_count!
  end
end
