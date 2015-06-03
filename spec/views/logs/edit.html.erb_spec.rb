require 'rails_helper'

RSpec.describe "logs/edit", type: :view do
  before(:each) do
    @log = assign(:log, Log.create!(
      :severity => :info,
      :message => "MyString",
      :instance => nil
    ))
  end

  it "renders the edit log form" do
    render

    assert_select "form[action=?][method=?]", log_path(@log), "post" do

      assert_select "input#log_severity[name=?]", "log[severity]"

      assert_select "input#log_message[name=?]", "log[message]"

      assert_select "input#log_instance_id[name=?]", "log[instance_id]"
    end
  end
end
