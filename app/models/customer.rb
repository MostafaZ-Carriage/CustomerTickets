class Customer < User
  has_many :created_tickets, foreign_key: :creator_id, as: :creator, class_name: 'Ticket'

  def self.can_create_ticket?
    true
  end

  private

  def should_creator_present?
    creator_type.present?
  end
end