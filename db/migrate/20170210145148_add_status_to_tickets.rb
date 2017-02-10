class AddStatusToTickets < ActiveRecord::Migration[5.0]
  def up
    add_column :tickets, :status, :integer, default: TicketStatus::OPEN
  end

  def down
    remove_column :tickets, :status
  end
end
