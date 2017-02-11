class Agent < User
  has_many :closed_tickets, foreign_key: :closer_id, as: :closer, class_name: 'Ticket'

  def self.can_close_ticket?
    true
  end
end