class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.string :quantity
      t.string :brands
      t.string :categories
      t.string :ingredients
      t.string :upc_code

      t.timestamps
    end
  end
end
