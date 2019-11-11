class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :cat_id
      t.integer :renter_id
      t.datetime :date

      t.timestamps
    end
  end
end
