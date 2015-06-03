require 'rails_helper'

RSpec.describe "logs/index", type: :view do
  before(:each) do
    assign(:logs, [
      Log.create!(
        :severity => :info,
        :message => "Message",
        :instance => nil
      ),
      Log.create!(
        :severity => :info,
        :message => "Message",
        :instance => nil
      )
    ])
  end

  it "renders a list of logs" do
    render
    assert_select "tr>td", :text => "INFO".to_s, :count => 2
    assert_select "tr>td", :text => "Message".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
