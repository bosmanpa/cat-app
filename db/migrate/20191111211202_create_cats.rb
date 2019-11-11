class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :neighborhood
      t.decimal :price, precision: 20, scale: 2
      t.string :breed
      t.integer :owner_id

      t.timestamps
    end
  end
end
