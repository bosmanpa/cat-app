class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :reservation_id
      t.string :owner_review
      t.integer :owner_rating
      t.string :renter_review
      t.integer :renter_rating

      t.timestamps
    end
  end
end
