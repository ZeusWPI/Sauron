class CreateAvailables < ActiveRecord::Migration[5.0]
  def change
    create_table :availables do |t|
      t.references :edition
      t.references :item

      t.integer :amount, null: false, default: 0

      t.timestamps
    end
  end
end
