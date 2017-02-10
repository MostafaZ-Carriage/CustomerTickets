class Agent < User
  has_many :closed_tickets, foreign_key: :closer_id, as: :closer, class_name: 'Ticket'

  def can_create_ticket?
    false
  end

  def can_close_ticket?
    true
  end
end