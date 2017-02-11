class AddCreatorPolymophicToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :creator_id, :integer
    add_column :users, :creator_type, :string
  end

  def down
    remove_column :users, :creator_id, :integer
    remove_column :users, :creator_type, :string
  end
end
