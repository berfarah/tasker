class ChangeHadErrorsToFailedOnInstances < ActiveRecord::Migration
  def self.up
    rename_column :instances, :had_errors, :failed
  end

  def self.down
    # rename_column :instances, :failed, :had_errors
  end
end
