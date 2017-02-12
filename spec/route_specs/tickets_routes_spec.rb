require 'rails_helper'

RSpec.describe 'routing to tickets', :type => :routing do
  it 'should route to list ticket' do
    expect(get: 'tickets').to route_to({controller: 'tickets', action: 'index'})
  end

  it 'should route to find an ticket' do
    expect(get: '/tickets/1').to route_to({ controller: 'tickets', action: 'show', id: '1'})
  end

  it 'should route to create an ticket' do
    expect(post: '/tickets').to route_to({ controller: 'tickets', action: 'create'})
  end

  it 'should route to update an ticket' do
    expect(put: '/tickets/1').to route_to({ controller: 'tickets', action: 'update', id: '1'})
  end

  it 'should route to destroy an ticket' do
    expect(delete: '/tickets/1').to route_to({ controller: 'tickets', action: 'destroy', id: '1'})
  end
end