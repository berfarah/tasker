class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :name
      t.integer :interval
      t.string :scalar
      t.string :recipients
      t.string :report

      t.timestamps null: false
    end
  end
end
