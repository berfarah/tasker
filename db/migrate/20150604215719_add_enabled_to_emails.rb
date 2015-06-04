class AddEnabledToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :enabled, :boolean
  end
end
