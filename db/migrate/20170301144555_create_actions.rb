class CreateActions < ActiveRecord::Migration[5.0]
  def change
    create_table :actions do |t|
      t.references :reservation
      t.integer :amount, null: false, default: 0
      t.string :message

      t.timestamps
    end
  end
end
