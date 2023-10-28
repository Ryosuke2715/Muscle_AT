class CreateMealComments < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_comments do |t|
      t.integer :meal_post_id, null: false
      t.integer :customer_id, null: false
      t.text :comment_content,   null: false

      t.timestamps
    end
  end
end
