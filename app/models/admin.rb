class Admin < User
  has_many :tickets, foreign_key: :creator_id, as: :creator
  has_many :tickets, foreign_key: :closer_id, as: :closer

  def can_create_ticket?
    true
  end

  def can_close_ticket?
    true
  end
end