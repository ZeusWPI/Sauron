require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  verify_fixtures Reservation

  setup do
    Reservation.where(partner: partners(:Hilok)).where(item: availables(:tent)).destroy_all
    @reservation = Reservation.create partner: partners(:Hilok), item: availables(:tent)
  end

  test 'reservations should be joined' do
    duplicate   = Reservation.new partner: @reservation.partner, item: @reservation.item
    duplicate.valid?
    assert duplicate.errors.messages.has_key?(:item)
  end

  test 'update status' do
    @reservation.update status: :approved
    @reservation.update reserved_count: 20
    assert_equal @reservation.status, 'pending'
  end
end
