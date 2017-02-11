require 'test_helper'

class TicketsRoutesTest < ActionController::TestCase
  test 'should route to list ticket' do
    assert_routing({ method: 'get', path: '/tickets' }, { controller: 'tickets', action: 'index'})
  end

  test 'should route to find an ticket' do
    assert_routing({ method: 'get', path: '/tickets/1' }, { controller: 'tickets', action: 'show', id: '1'})
  end

  test 'should route to create an ticket' do
    assert_routing({ method: 'post', path: '/tickets' }, { controller: 'tickets', action: 'create'})
  end

  test 'should route to update an ticket' do
    assert_routing({ method: 'put', path: '/tickets/1' }, { controller: 'tickets', action: 'update', id: '1'})
  end

  test 'should route to destroy an ticket' do
    assert_routing({ method: 'delete', path: '/tickets/1' }, { controller: 'tickets', action: 'destroy', id: '1'})
  end
end