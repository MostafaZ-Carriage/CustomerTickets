module AuthorizedByDestroyer
  extend ActiveSupport::Concern

  included do
    attr_accessor :destroyer
  end

  def destroy
    errors.add(:id, "you can not destroy that #{self.class.name}") unless destroyer.try("can_destroy_#{self.class.name.downcase}?".to_sym, self)
    super if errors.blank?
  end
end