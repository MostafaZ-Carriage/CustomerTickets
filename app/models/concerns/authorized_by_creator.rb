module AuthorizedByCreator
  extend ActiveSupport::Concern

  included do
    belongs_to :creator, polymorphic: true, optional: true
    validates_presence_of :creator_id, if: :should_creator_present?
    validate :creator_types, if: :should_creator_present?, on: :create
  end

  private

  def creator_types
    errors.add(:creator_type, "#{creator.class.name} can not create a #{self.class.name}") unless creator.try(:class).try("can_create_#{self.class.name.downcase}?".to_sym)
  end

  def should_creator_present?
    true
  end
end