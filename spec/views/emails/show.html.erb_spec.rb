require 'rails_helper'

RSpec.describe "emails/show", type: :view do
  before(:each) do
    @email = assign(:email, Email.create!(
      :name => "Name",
      :interval => 1,
      :scalar => "Scalar",
      :recipients => "Recipients",
      :report => "Report"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Scalar/)
    expect(rendered).to match(/Recipients/)
    expect(rendered).to match(/Report/)
  end
end
