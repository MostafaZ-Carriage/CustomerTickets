class Agent < User
  has_many :tickets, foreign_key: :closer_id, as: :closer

  def can_create_ticket?
    false
  end

  def can_close_ticket?
    true
  end
end