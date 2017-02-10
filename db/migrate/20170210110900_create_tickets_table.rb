class CreateTicketsTable < ActiveRecord::Migration[5.0]
  def up
    create_table :tickets do |t|
      t.string :title, default: Ticket::DEFAULT_TITLE
      t.text :description
      t.timestamps
    end
  end

  def down
    drop_table :tickets
  end
end
