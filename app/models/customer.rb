class Customer < User
  has_many :created_tickets, foreign_key: :creator_id, as: :creator, class_name: 'Ticket'

  def self.can_create_ticket?
    true
  end

  def can_update_customer?(customer)
    self.id == customer.id
  end

  def can_update_ticket?(ticket)
    ticket.creator_id == self.id
  end

  private

  def should_creator_present?
    creator_type.present?
  end
end