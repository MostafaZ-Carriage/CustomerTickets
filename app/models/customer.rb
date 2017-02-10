class Customer < User
  has_many :open_tickets, foreign_key: :creator_id, as: :creator, class_name: 'Ticket'

  def can_create_ticket?
    true
  end

  def can_close_ticket?
    false
  end
end