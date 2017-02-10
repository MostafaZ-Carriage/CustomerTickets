class AddCloserTypeToTickets < ActiveRecord::Migration[5.0]
  def up
    add_column :tickets, :closer_type, :string
  end

  def down
    remove_column :tickets, :closer_type
  end
end
