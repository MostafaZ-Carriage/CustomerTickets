require 'rails_helper'

RSpec.describe 'routing to agents', :type => :routing do
  it 'should route to list agent' do
    expect(get: 'agents').to route_to({controller: 'agents', action: 'index'})
  end

  it 'should route to find an agent' do
    expect(get: '/agents/1').to route_to({ controller: 'agents', action: 'show', id: '1'})
  end

  it 'should route to create an agent' do
    expect(post: '/agents').to route_to({ controller: 'agents', action: 'create'})
  end

  it 'should route to update an agent' do
    expect(put: '/agents/1').to route_to({ controller: 'agents', action: 'update', id: '1'})
  end

  it 'should route to destroy an agent' do
    expect(delete: '/agents/1').to route_to({ controller: 'agents', action: 'destroy', id: '1'})
  end
end