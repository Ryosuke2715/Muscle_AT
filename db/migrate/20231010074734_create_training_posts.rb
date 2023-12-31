class CreateTrainingPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :training_posts do |t|
      t.integer :customer_id, null: false
      t.string :title,   null: false
      t.text :content,   null: false
      t.date :date,   null: false

      t.timestamps
    end
  end
end
