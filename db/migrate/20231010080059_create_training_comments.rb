class CreateTrainingComments < ActiveRecord::Migration[6.1]
  def change
    create_table :training_comments do |t|
      t.integer :customer_id, foreign_key: true, null: false
      t.integer :training_post_id, foreign_key: true, null: false
      t.text :comment_content,   null: false

      t.timestamps
    end
  end
end
