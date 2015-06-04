require 'rails_helper'

RSpec.describe "emails/index", type: :view do
  before(:each) do
    assign(:emails, [
      Email.create!(
        :name => "Name",
        :interval => 1,
        :scalar => "Scalar",
        :recipients => "Recipients",
        :report => "Report"
      ),
      Email.create!(
        :name => "Name",
        :interval => 1,
        :scalar => "Scalar",
        :recipients => "Recipients",
        :report => "Report"
      )
    ])
  end

  it "renders a list of emails" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Scalar".to_s, :count => 2
    assert_select "tr>td", :text => "Recipients".to_s, :count => 2
    assert_select "tr>td", :text => "Report".to_s, :count => 2
  end
end
