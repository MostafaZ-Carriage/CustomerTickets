class Ticket < ApplicationRecord
  include AuthorizedByCreator

  DEFAULT_TITLE = 'New Ticket'

  belongs_to :closer, polymorphic: true, optional: true

  validates_presence_of :closer, if: proc{status == TicketStatus::CLOSE}
  validate :closer_types, if: proc {closer.present?}
  before_save :assign_close_status, if: proc {closer.present?}

  private

  def assign_close_status
    self.status = TicketStatus::CLOSE
  end

  def closer_types
    errors.add(:closer_type, 'you can not close a ticket') unless closer.class.try(:can_close_ticket?)
  end
end