class CreateTrainingFavs < ActiveRecord::Migration[6.1]
  def change
    create_table :training_favs do |t|
      t.integer :customer_id, unique: true, null: false
      t.integer :training_post_id, null: false

      t.timestamps
    end
  end
end
