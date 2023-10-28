class CreateMealFavs < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_favs do |t|
      t.references :customer, unique: true, null: false
      t.references :meal_post, null: false

      t.timestamps
    end
  end
end
