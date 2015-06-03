class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.timestamp :started_at
      t.timestamp :ended_at
      t.boolean :had_errors, default: false
      t.belongs_to :task, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
