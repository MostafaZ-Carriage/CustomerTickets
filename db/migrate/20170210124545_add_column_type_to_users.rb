class AddColumnTypeToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :type, :string
  end

  def down
    remove_column :users, :type
  end
end
