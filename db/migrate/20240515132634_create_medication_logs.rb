class CreateMedicationLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :sheltered_medication_logs do |t|
      t.references :sheltered_medication, optional: true, foreign_key: true
      t.references :medicin, optional: true, foreign_key: true
      t.references :sheltered, optional: true, foreign_key: true
      t.integer :quantity, optional: true
      t.string :unit, optional: true


      t.timestamps
    end
  end
end
