class AddIntervalAndScalarToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :scalar, :string
    add_column :tasks, :interval, :integer
  end
end
