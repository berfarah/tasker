class AddInstanceToLogs < ActiveRecord::Migration
  def change
    add_reference :logs, :instance, index: true, foreign_key: true
    remove_reference :logs, :task
  end
end
