class CreateTrainingFavs < ActiveRecord::Migration[6.1]
  def change
    create_table :training_favs do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :training_post, foreign_key: true, null: false
    end

    add_index :training_favs, [:customer_id, :training_post_id], unique: true
  end
end