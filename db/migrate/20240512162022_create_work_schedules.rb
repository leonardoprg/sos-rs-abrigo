class CreateWorkSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :work_schedules do |t|
      t.references :organization, null: false, foreign_key: true
      t.date :scheduled_date, null: false

      t.timestamps
    end
  end
end
