class CreateVolunteerWorkSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :volunteer_work_schedules do |t|
      t.references :user, null: false, foreign_key: true
      t.references :work_schedule, null: false, foreign_key: true
      t.string :work_shift
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end

    add_index :volunteer_work_schedules, [
      :user_id,
      :work_schedule_id,
      :role_id,
      :work_shift
    ], unique: true, name: 'index_volunteer_work_schedules_user_id_unique'
  end
end
