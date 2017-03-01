class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :partner,   index: true
      t.references :available, index: true

      t.integer :status

      t.integer :reserved_count
      t.integer :picked_up_count

      t.timestamps
    end
  end
end
