class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :org_number
      t.boolean :active, default: true
      t.references :restaurant_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
