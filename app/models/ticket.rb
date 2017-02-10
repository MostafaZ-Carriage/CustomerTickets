class Ticket < ApplicationRecord
  DEFAULT_TITLE = 'New Ticket'

  belongs_to :creator, polymorphic: true
  belongs_to :closer, class_name: 'Agent', optional: true

  validates_presence_of :closer, if: proc{status == TicketStatus::CLOSE}
  validate :creator_types
  before_save :assign_close_status, if: proc {closer.present?}

  private

  def assign_close_status
    self.status = TicketStatus::CLOSE
  end

  def creator_types
    errors.add(:creator_type, 'you can not create a ticket') unless creator.try(:type).in? %w(Customer Admin)
  end
end