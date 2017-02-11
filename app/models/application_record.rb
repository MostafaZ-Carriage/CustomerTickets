class ApplicationRecord < ActiveRecord::Base
  include AuthorizedByCreator, AuthorizedByUpdater
  self.abstract_class = true
end
