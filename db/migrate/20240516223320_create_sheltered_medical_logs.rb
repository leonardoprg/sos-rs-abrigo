class CreateShelteredMedicalLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :sheltered_medical_logs do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :sheltered, null: false, foreign_key: true
      t.text :description, null: false

      t.timestamps
    end
  end
end
