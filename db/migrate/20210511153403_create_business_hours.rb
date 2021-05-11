class CreateBusinessHours < ActiveRecord::Migration[6.0]
  def change
    create_table :business_hours do |t|
      t.integer :day
      t.time :open
      t.time :close
      t.boolean :opened
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
