class ApplicationRecord < ActiveRecord::Base
  include AuthorizedByCreator, AuthorizedByUpdater, AuthorizedByDestroyer
  self.abstract_class = true
end
