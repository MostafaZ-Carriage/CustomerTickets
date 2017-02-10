class Ticket < ApplicationRecord
  DEFAULT_TITLE = 'New Ticket'

  belongs_to :creator, class_name: 'Customer'
  belongs_to :closer, class_name: 'Agent', optional: true
end