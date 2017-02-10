class AddCloserIdToTickets < ActiveRecord::Migration[5.0]
  def up
    add_column :tickets, :closer_id, :integer
  end

  def down
    remove_column :tickets, :closer_id
  end
end
