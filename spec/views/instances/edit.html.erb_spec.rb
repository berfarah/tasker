require 'rails_helper'

RSpec.describe "instances/edit", type: :view do
  before(:each) do
    @instance = assign(:instance, Instance.create!(
      :failed => false,
      :task => nil
    ))
  end

  it "renders the edit instance form" do
    render

    assert_select "form[action=?][method=?]", instance_path(@instance), "post" do

      assert_select "input#instance_failed[name=?]", "instance[failed]"

      assert_select "input#instance_task_id[name=?]", "instance[task_id]"
    end
  end
end
