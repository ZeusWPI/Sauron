require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  verify_fixtures Item

  setup do
    @item = Item.new
    @item.name = 'test'
    @item.category = Category.create(name: 'test')
    @item.save
  end

  test 'barcode should be generated' do
    assert_not_nil @item.barcode
    assert_not_nil @item.barcode_img
  end
end
