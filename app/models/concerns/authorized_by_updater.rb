module AuthorizedByUpdater
  extend ActiveSupport::Concern

  included do
    validate :can_update, on: :update
  end

  private

  def can_update
    errors.add(:id, "you can not update that #{self.class.name}") unless User.current_user.try("can_update_#{self.class.name.downcase}?".to_sym, self) || User.sign_in_action
  end
end