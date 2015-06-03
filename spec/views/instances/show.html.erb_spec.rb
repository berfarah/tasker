require 'rails_helper'

RSpec.describe "instances/show", type: :view do
  before(:each) do
    @instance = assign(:instance, Instance.create!(
      :failed => false,
      :task => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
