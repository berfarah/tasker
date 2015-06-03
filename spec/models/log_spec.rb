require 'rails_helper'

RSpec.describe Log, type: :model do
  it 'should have a factory' do
    expect(FactoryGirl.build(:log)).to be_valid
  end

  it 'is invalid without a message' do
    FactoryGirl.build(:log, message: nil).should_not be_valid
  end

  it 'is invalid without a severity' do
    FactoryGirl.build(:log, severity: nil).should_not be_valid
  end
end
