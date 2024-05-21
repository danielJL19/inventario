class CreateProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
