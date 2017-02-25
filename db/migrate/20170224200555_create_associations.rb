class CreateAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :associations do |t|
      t.references :partner, null: false
      t.references :club,    null: false, index: true

      t.timestamps
    end
  end
end
