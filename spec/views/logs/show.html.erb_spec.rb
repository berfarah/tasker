require 'rails_helper'

RSpec.describe "logs/show", type: :view do
  before(:each) do
    @log = assign(:log, Log.create!(
      :severity => :info,
      :message => "Message",
      :instance => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Severity/)
    expect(rendered).to match(/Message/)
    expect(rendered).to match(//)
  end
end
