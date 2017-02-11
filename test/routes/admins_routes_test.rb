require 'test_helper'

class AdminsRoutesTest < ActionController::TestCase
  test 'should route to list admin' do
    assert_routing({ method: 'get', path: '/admins' }, { controller: 'admins', action: 'index'})
  end

  test 'should route to find an admin' do
    assert_routing({ method: 'get', path: '/admins/1' }, { controller: 'admins', action: 'show', id: '1'})
  end

  test 'should route to create an admin' do
    assert_routing({ method: 'post', path: '/admins' }, { controller: 'admins', action: 'create'})
  end

  test 'should route to update an admin' do
    assert_routing({ method: 'put', path: '/admins/1' }, { controller: 'admins', action: 'update', id: '1'})
  end

  test 'should route to destroy an admin' do
    assert_routing({ method: 'delete', path: '/admins/1' }, { controller: 'admins', action: 'destroy', id: '1'})
  end
end