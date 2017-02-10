ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  FactoryGirl.find_definitions
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #fixtures :all

  # Add more helper methods to be used by all tests here...
  def class_exists?(klass)
    klass.is_a? Class
  end

  def obj_has_attribute?(obj, attribute_name)
    obj.has_attribute?(attribute_name)
  end

  def obj_can_respond_to?(obj, method_name)
    obj.respond_to?(method_name)
  end
end
