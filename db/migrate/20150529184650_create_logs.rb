class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :severity
      t.string :message
      t.belongs_to :task, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
