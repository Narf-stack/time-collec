class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
    add_index :contacts, [:type, :shop_id]
  end
end
