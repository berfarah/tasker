class ChangeTimeStampsOnInstances < ActiveRecord::Migration
  def self.up
    rename_column :instances, :ended_at, :finished_at
    remove_column :instances, :started_at
  end

  def self.down
    # rename_column :instances, :failed, :had_errors
  end
end
