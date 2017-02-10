class Admin < User
  has_many :tickets, foreign_key: :creator_id, as: :creator
end