require 'rails_helper'

RSpec.describe "instances/new", type: :view do
  before(:each) do
    assign(:instance, Instance.new(
      :failed => false,
      :task => nil
    ))
  end

  it "renders new instance form" do
    render

    assert_select "form[action=?][method=?]", instances_path, "post" do

      assert_select "input#instance_failed[name=?]", "instance[failed]"

      assert_select "input#instance_task_id[name=?]", "instance[task_id]"
    end
  end
end
