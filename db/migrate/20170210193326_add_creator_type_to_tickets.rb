class AddCreatorTypeToTickets < ActiveRecord::Migration[5.0]
  def up
    add_column :tickets, :creator_type, :string
  end

  def down
    remove_column :tickets, :creator_type
  end
end
