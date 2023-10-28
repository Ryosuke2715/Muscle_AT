class CreateMealFavs < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_favs do |t|
      t.integer :customer_id, foreign_key: true, unique: true, null: false
      t.integer :meal_post_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
