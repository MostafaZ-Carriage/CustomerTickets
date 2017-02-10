class Customer < User
  has_many :tickets, foreign_key: :creator_id, as: :creator

  def can_create_ticket?
    true
  end

  def can_close_ticket?
    false
  end
end