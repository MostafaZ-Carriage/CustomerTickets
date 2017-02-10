class Agent < User
  has_many :tickets, foreign_key: :closer_id
end