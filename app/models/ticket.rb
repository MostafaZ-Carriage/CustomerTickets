class Ticket < ApplicationRecord
  DEFAULT_TITLE = 'New Ticket'

  belongs_to :creator, class_name: 'Customer'

  validates_presence_of :creator
end