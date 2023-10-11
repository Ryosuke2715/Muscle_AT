class CreateTrainingFavs < ActiveRecord::Migration[6.1]
  def change
    create_table :training_favs do |t|
      t.integer :customer_id, foreign_key: true, unique: true, null: false
      t.integer :training_post_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
