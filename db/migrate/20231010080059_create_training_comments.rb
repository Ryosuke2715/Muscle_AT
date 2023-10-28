class CreateTrainingComments < ActiveRecord::Migration[6.1]
  def change
    create_table :training_comments do |t|
      t.references :customer, null: false
      t.references :training_post, null: false
      t.text :comment_content, null: false

      t.timestamps
    end
  end
end