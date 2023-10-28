class CreateMealFavs < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_favs do |t|
      t.integer :customer_id, unique: true, null: false
      t.integer :meal_post_id, null: false

      t.timestamps
    end
  end
end
