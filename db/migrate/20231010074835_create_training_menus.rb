class CreateTrainingMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :training_menus do |t|
      t.references :training_post, null: false, foreign_key: true
      t.references :training_tag, null: false, foreign_key: true
      t.decimal :kg, null: false
      t.integer :rep, null: false, default: 0
      t.integer :set, null: false, default: 0

      t.timestamps
    end
  end
end