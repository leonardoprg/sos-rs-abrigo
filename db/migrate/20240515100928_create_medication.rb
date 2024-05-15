class CreateMedication < ActiveRecord::Migration[7.0]
  def change
    create_table :sheltered_medications do |t|
      t.references :medicin, null: false, foreign_key: true
      t.references :sheltered, null: false, foreign_key: true
      t.integer :quantity
      t.string :unit
      t.integer :frequency, optional: true
      t.date :start_date, optional: true
      t.date :end_date, optional: true

      t.timestamps
    end
  end
end
