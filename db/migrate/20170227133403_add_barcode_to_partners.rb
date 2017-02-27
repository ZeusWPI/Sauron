class AddBarcodeToPartners < ActiveRecord::Migration[5.0]
  def change
    add_column     :partners, :barcode, :string
    add_attachment :partners, :barcode_img
  end
end
