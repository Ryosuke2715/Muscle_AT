class CreateTrainingComments < ActiveRecord::Migration[6.1]
  def change
    create_table :training_comments do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :training_post, foreign_key: true, null: false
      t.text :comment_content, null: false

      t.timestamps
    end
  end
end