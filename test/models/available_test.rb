require 'test_helper'

class AvailableTest < ActiveSupport::TestCase
  verify_fixtures Available

  setup do
    @available = availables(:tent)
  end

  test 'verify delegation to item' do
    assert @available.respond_to?(:name)
    assert_equal @available.name, @available.item.name

    assert @available.respond_to?(:description)
    assert_equal @available.description, @available.item.description

    assert @available.respond_to?(:price)
    assert_equal @available.price, @available.item.price
  end
end
