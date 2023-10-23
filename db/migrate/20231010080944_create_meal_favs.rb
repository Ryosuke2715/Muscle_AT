class CreateMealFavs < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_favs do |t|
      t.references :customer, foreign_key: true, unique: true, null: false
      t.references :meal_post, foreign_key: true, null: false

      t.timestamps
    end
  end
end
