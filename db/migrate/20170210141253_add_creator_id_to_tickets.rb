class AddCreatorIdToTickets < ActiveRecord::Migration[5.0]
  def up
    add_column :tickets, :creator_id, :integer

  end

  def down
    remove_column :tickets, :creator_id
  end
end
