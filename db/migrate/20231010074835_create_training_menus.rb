class CreateTrainingMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :training_menus do |t|
      t.integer :training_post_id, null: false
      t.integer :training_tag_id, null: false
      t.decimal :kg,      null: false
      t.integer :rep,     null: false, default: 0
      t.integer :set,     null: false, default: 0

      t.timestamps
    end
  end
end
