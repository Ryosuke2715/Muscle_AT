class AddProfileMessageToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :profile_message, :string
  end
end
