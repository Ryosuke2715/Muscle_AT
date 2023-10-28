class CreateMealPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_posts do |t|
      t.references :customer, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.string :meal_image, null: true
      t.date :date, null: false

      t.timestamps
    end
  end
end