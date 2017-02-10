class Customer < User
  has_many :tickets, foreign_key: :creator_id
end