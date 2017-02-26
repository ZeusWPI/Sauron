class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, index: true
      t.date :deadline

      t.timestamps
    end

    add_reference :items, :category
    add_index     :items, :category
  end
end
