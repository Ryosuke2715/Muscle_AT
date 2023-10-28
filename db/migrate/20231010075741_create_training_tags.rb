class CreateTrainingTags < ActiveRecord::Migration[6.1]
  def change
    create_table :training_tags do |t|
      t.string :training_tag, unique: true, null: false
      t.timestamps
    end
  end
end