class CreateFreeEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :free_entries do |t|
      t.integer :training_post_id, null: false
      t.string :exercise,   null: true
      t.decimal :kg,      null: true
      t.integer :rep,     null: false, default: 0
      t.integer :set,     null: false, default: 0

      t.timestamps
    end
  end
end
