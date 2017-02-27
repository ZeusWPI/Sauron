class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :parent
      t.string :name, null: false, index: true
      t.string :description
      t.integer :price_cents

      t.string :barcode
      t.attachment :barcode_img

      t.string :type

      t.timestamps
    end
  end
end
