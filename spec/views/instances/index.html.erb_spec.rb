require 'rails_helper'

RSpec.describe "instances/index", type: :view do
  before(:each) do
    assign(:instances, [
      Instance.create!(
        :failed => false,
        :task => nil
      ),
      Instance.create!(
        :failed => false,
        :task => nil
      )
    ])
  end

  it "renders a list of instances" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
