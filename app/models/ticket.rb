class Ticket < ApplicationRecord
  DEFAULT_TITLE = 'New Ticket'

  belongs_to :creator, class_name: 'Customer'
  belongs_to :closer, class_name: 'Agent', optional: true

  validates_presence_of :closer, if: proc{status == TicketStatus::CLOSE}
  before_save :assign_close_status, if: proc {closer.present?}

  private

  def assign_close_status
    self.status = TicketStatus::CLOSE
  end
end