class CreateWeights < ActiveRecord::Migration[6.1]
  def change
    create_table :weights do |t|
      t.integer :customer_id, unique: true, null: false
      t.decimal :weight, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
