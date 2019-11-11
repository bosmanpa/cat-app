class CreateCatTags < ActiveRecord::Migration[6.0]
  def change
    create_table :cat_tags do |t|
      t.integer :cat_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
