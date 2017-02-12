# require 'test_helper'
# class GetTicketPageTest < ActiveSupport::TestCase
#
#   setup do
#     (0...BULK_CREATE_SIZE).each {|i| create(:ticket_customer, creator: create(:customer, email: "xxxx#{i}@xxx.xxx"))}
#   end
#
#   test 'Get Ticket Page interactor exists' do
#     class_exists?(GetTicketPage)
#   end
#
#   test 'send page' do
#     result = GetTicketPage.call(response: {authenticated: true}, page: 1, per_page: BULK_CREATE_SIZE-1)
#     assert result.success?
#     assert result.response[:tickets].size == BULK_CREATE_SIZE-1
#   end
#
#   test 'Do not send page' do
#     result = GetTicketPage.call(response: {authenticated: true})
#     assert result.success?
#     assert result.response[:tickets].size == BULK_CREATE_SIZE
#   end
# end