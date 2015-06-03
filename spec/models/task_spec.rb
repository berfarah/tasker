require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'should have a factory' do
    expect(FactoryGirl.build(:task)).to be_valid
  end

  it 'is invalid without a name' do
    FactoryGirl.build(:task, name: nil).should_not be_valid
  end

  it 'is invalid without external' do
    FactoryGirl.build(:task, external: nil).should_not be_valid
  end
end
