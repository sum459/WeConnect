class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :user_name, :string
    add_column :users, :contact, :string
    add_column :users, :country, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
  end
end
