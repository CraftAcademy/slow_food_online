class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :allergy_info
      t.decimal :price
      t.integer :calories
      t.string :img_url

      t.timestamps null: false
    end
  end
end
