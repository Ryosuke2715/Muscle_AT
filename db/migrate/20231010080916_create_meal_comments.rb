class CreateMealComments < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_comments do |t|
      t.references :meal_post, null: false
      t.references :customer, null: false
      t.text :comment_content, null: false

      t.timestamps
    end
  end
end