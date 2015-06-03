class AddScriptToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :script, :string
  end
end
