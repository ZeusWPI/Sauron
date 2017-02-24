class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.references :edition
      t.string :name,                 null: false
      t.string :authentication_token, null: false

      t.timestamps
    end
  end
end
