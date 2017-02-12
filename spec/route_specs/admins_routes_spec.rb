require 'rails_helper'

RSpec.describe 'routing to admins', :type => :routing do
  it 'should route to list admin' do
    expect(get: 'admins').to route_to({controller: 'admins', action: 'index'})
  end

  it 'should route to find an admin' do
    expect(get: '/admins/1').to route_to({ controller: 'admins', action: 'show', id: '1'})
  end

  it 'should route to create an admin' do
    expect(post: '/admins').to route_to({ controller: 'admins', action: 'create'})
  end

  it 'should route to update an admin' do
    expect(put: '/admins/1').to route_to({ controller: 'admins', action: 'update', id: '1'})
  end

  it 'should route to destroy an admin' do
    expect(delete: '/admins/1').to route_to({ controller: 'admins', action: 'destroy', id: '1'})
  end
end