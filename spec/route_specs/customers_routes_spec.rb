require 'rails_helper'

RSpec.describe 'routing to customers', :type => :routing do
  it 'should route to list customer' do
    expect(get: 'customers').to route_to({controller: 'customers', action: 'index'})
  end

  it 'should route to find an customer' do
    expect(get: '/customers/1').to route_to({ controller: 'customers', action: 'show', id: '1'})
  end

  it 'should route to create an customer' do
    expect(post: '/customers').to route_to({ controller: 'customers', action: 'create'})
  end

  it 'should route to update an customer' do
    expect(put: '/customers/1').to route_to({ controller: 'customers', action: 'update', id: '1'})
  end

  it 'should route to destroy an customer' do
    expect(delete: '/customers/1').to route_to({ controller: 'customers', action: 'destroy', id: '1'})
  end
end