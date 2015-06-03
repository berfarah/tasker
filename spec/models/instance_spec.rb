require 'rails_helper'

RSpec.describe Instance, type: :model do
  it 'should have a factory' do
    expect(FactoryGirl.build(:instance)).to be_valid
  end

  it 'should validate that finished_at happens after created_at' do
    expect(Instance.new(created_at: Time.now,
                        finished_at: Time.now - 5).valid?).to be_falsy
  end
end
