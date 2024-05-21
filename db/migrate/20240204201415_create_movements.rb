class CreateMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :movements do |t|
      t.integer :type_movement
      t.integer :amount
      t.string :reason
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
