require 'test_helper'

class AgentsRoutesTest < ActionController::TestCase
  test 'should route to list agent' do
    assert_routing({ method: 'get', path: '/agents' }, { controller: 'agents', action: 'index'})
  end

  test 'should route to find an agent' do
    assert_routing({ method: 'get', path: '/agents/1' }, { controller: 'agents', action: 'show', id: '1'})
  end

  test 'should route to create an agent' do
    assert_routing({ method: 'post', path: '/agents' }, { controller: 'agents', action: 'create'})
  end

  test 'should route to update an agent' do
    assert_routing({ method: 'put', path: '/agents/1' }, { controller: 'agents', action: 'update', id: '1'})
  end

  test 'should route to destroy an agent' do
    assert_routing({ method: 'delete', path: '/agents/1' }, { controller: 'agents', action: 'destroy', id: '1'})
  end
end