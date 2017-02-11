require 'test_helper'

class CustomersRoutesTest < ActionController::TestCase
  test 'should route to list customer' do
    assert_routing({ method: 'get', path: '/customers' }, { controller: 'customers', action: 'index'})
  end

  test 'should route to find an customer' do
    assert_routing({ method: 'get', path: '/customers/1' }, { controller: 'customers', action: 'show', id: '1'})
  end

  test 'should route to create an customer' do
    assert_routing({ method: 'post', path: '/customers' }, { controller: 'customers', action: 'create'})
  end

  test 'should route to update an customer' do
    assert_routing({ method: 'put', path: '/customers/1' }, { controller: 'customers', action: 'update', id: '1'})
  end

  test 'should route to destroy an customer' do
    assert_routing({ method: 'delete', path: '/customers/1' }, { controller: 'customers', action: 'destroy', id: '1'})
  end
end