class AddColumnLengthToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :length, :string
  end
end
