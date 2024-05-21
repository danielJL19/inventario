class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :serial_number
      t.integer :unit_cost
      t.integer :sale_price
      t.references :category, null: false, foreign_key: true
      t.integer :amount
      t.references :provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
