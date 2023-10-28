class CreateMealComments < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_comments do |t|
      t.integer :meal_post_id, foreign_key: true, null: false
      t.integer :customer_id, foreign_key: true, null: false
      t.text :comment_content,   null: false

      t.timestamps
    end
  end
end
