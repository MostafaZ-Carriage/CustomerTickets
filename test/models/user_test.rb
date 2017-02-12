# require 'test_helper'
# class UserTest < ActiveSupport::TestCase
#   setup do
#     @new_user = User.new
#   end
#
#   test 'User class exists' do
#     assert class_exists?(User)
#   end
#
#   test 'A user has email' do
#     assert user_has_attribute?(:email)
#   end
#
#   test 'A user has created_at' do
#     assert user_has_attribute?(:created_at)
#   end
#
#   test 'A user has updated_at' do
#     assert user_has_attribute?(:updated_at)
#   end
#
#   test 'A user has type' do
#     assert user_has_attribute?(:type)
#   end
#
#   test 'Email should be presence' do
#     assert_not @new_user.valid?
#   end
#
#   test 'Email should be unique' do
#     @new_user.email = create(:customer).email
#     assert_not @new_user.valid?
#   end
#
#   test 'Type should be nil' do
#     assert_nil @new_user.type
#   end
#
#   test 'A user has creator_type' do
#     assert user_has_attribute?(:creator_type)
#   end
#
#   test 'A user has creator_id' do
#     assert user_has_attribute?(:creator_id)
#   end
#
#   test 'A user can not has customer creator' do
#     assert_not build(:customer_creates_user).save
#   end
#
#   test 'A user can not has admin creator' do
#     assert_not build(:admin_creates_user).save
#   end
#
#   test 'A user can not has agent creator' do
#     assert_not build(:agent_creates_user).save
#   end
#
#   test 'A user can not has non user creator' do
#     assert_not build(:non_user_creates_user).save
#   end
#
#   private
#
#   def user_has_attribute?(attribute_name)
#     obj_has_attribute?(@new_user, attribute_name)
#   end
# end