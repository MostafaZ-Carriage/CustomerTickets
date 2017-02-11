class Admin < User
  has_many :created_tickets, foreign_key: :creator_id, as: :creator, class_name: 'Ticket'
  has_many :closed_tickets, foreign_key: :closer_id, as: :closer, class_name: 'Ticket'

  def self.can_create_ticket?
    true
  end

  def self.can_close_ticket?
    true
  end

  def self.can_create_admin?
    true
  end

  def self.can_create_customer?
    true
  end

  def self.can_create_agent?
    true
  end

  private

  def should_creator_present?
    Admin.exists? || creator_type.present?
  end
end