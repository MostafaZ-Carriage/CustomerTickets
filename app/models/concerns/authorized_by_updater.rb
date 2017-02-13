module AuthorizedByUpdater
  extend ActiveSupport::Concern

  included do
    attr_accessor :updater
    validate :can_update, on: :update
  end

  private

  def can_update
    errors.add(:id, "you can not update that #{self.class.name}") unless updater.try("can_update_#{self.class.name.downcase}?".to_sym, self) || User.sign_in_action || User.sign_out_action
  end
end