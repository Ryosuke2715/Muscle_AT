class CreateMealComments < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_comments do |t|
      t.references :meal_post, foreign_key: true, null: false
      t.references :customer, foreign_key: true, null: false
      t.text :comment_content, null: false

      t.timestamps
    end
  end
end