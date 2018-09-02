class CreateGuitars < ActiveRecord::Migration[5.2]
  def change
    create_table :guitars do |t|
      t.integer :uid
      t.string :brand
      t.string :model
      t.decimal :price
      t.text :description

      t.timestamps
    end
    add_index :guitars, :uid, unique: true
  end
end
