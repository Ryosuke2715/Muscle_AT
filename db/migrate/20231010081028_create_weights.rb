class CreateWeights < ActiveRecord::Migration[6.1]
  def change
    create_table :weights do |t|
      t.references :customer, foreign_key: true, unique: true, null: false
      t.decimal :weight, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end