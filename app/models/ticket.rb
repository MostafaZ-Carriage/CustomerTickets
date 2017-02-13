class Ticket < ApplicationRecord

  DEFAULT_TITLE = 'New Ticket'

  belongs_to :closer, polymorphic: true, optional: true

  validates_presence_of :closer, if: proc{status == TicketStatus::CLOSE}
  validate :closer_types, if: proc {closer.present?}
  before_save :handle_close_status, if: proc {closer.present?}

  private

  def handle_close_status
    self.closer=nil if self.status_was == TicketStatus::CLOSE && self.status == TicketStatus::OPEN
    self.status = TicketStatus::CLOSE if self.status_was == TicketStatus::OPEN || self.status_was == nil
  end

  def closer_types
    errors.add(:closer_type, 'you can not close a ticket') unless closer.class.try(:can_close_ticket?)
  end
end