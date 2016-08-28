require 'rails_helper'

RSpec.describe Ship, type: :model do
  context 'size' do
    it 'should return size of the given ship' do
      expect(Ship.ship_size(Ship::Types::SUBMARINE)).to eq(3)
    end

  end
end
