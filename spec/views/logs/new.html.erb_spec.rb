require 'rails_helper'

RSpec.describe "logs/new", type: :view do
  before(:each) do
    assign(:log, Log.new(
      :severity => :info,
      :message => "MyString",
      :instance => nil
    ))
  end

  it "renders new log form" do
    render

    assert_select "form[action=?][method=?]", logs_path, "post" do

      assert_select "input#log_severity[name=?]", "log[severity]"

      assert_select "input#log_message[name=?]", "log[message]"

      assert_select "input#log_instance_id[name=?]", "log[instance_id]"
    end
  end
end
