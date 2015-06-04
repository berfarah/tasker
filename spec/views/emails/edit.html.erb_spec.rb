require 'rails_helper'

RSpec.describe "emails/edit", type: :view do
  before(:each) do
    @email = assign(:email, Email.create!(
      :name => "MyString",
      :interval => 1,
      :scalar => "MyString",
      :recipients => "MyString",
      :report => "MyString"
    ))
  end

  it "renders the edit email form" do
    render

    assert_select "form[action=?][method=?]", email_path(@email), "post" do

      assert_select "input#email_name[name=?]", "email[name]"

      assert_select "input#email_interval[name=?]", "email[interval]"

      assert_select "input#email_scalar[name=?]", "email[scalar]"

      assert_select "input#email_recipients[name=?]", "email[recipients]"

      assert_select "input#email_report[name=?]", "email[report]"
    end
  end
end
