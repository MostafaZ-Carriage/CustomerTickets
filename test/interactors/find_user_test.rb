require 'test_helper'
class FindUserTest < ActiveSupport::TestCase

  test 'Find User interactor exists' do
    class_exists?(FindUser)
  end

  test 'successful find' do
    new_user_id = create(:customer).id
    result = FindUser.call(response: {authenticated: true}, id: new_user_id)
    assert result.success?
    assert result.response[:user][:id]==new_user_id
  end

  test 'unsuccessful find' do
    result = FindUser.call(response: {authenticated: true}, id: -1)
    assert_not result.success?
    assert_nil result.response[:user]
  end
end