class Ticket < ApplicationRecord
  DEFAULT_TITLE = 'New Ticket'

  belongs_to :creator, polymorphic: true
  belongs_to :closer, polymorphic: true, optional: true

  validates_presence_of :closer, if: proc{status == TicketStatus::CLOSE}
  validate :creator_types
  validate :closer_types, if: proc {closer.present?}
  before_save :assign_close_status, if: proc {closer.present?}

  private

  def assign_close_status
    self.status = TicketStatus::CLOSE
  end

  def creator_types
    errors.add(:creator_type, 'you can not create a ticket') unless creator.try(:can_create_ticket?)
  end

  def closer_types
    errors.add(:closer_type, 'you can not close a ticket') unless closer.try(:can_close_ticket?)
  end
end