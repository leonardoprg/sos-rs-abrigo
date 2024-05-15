class CreateMedicin < ActiveRecord::Migration[7.0]
  def change
    create_table :medicins do |t|
      t.string :name, null: false
      t.string :leaflet, optional: true

      t.timestamps
    end

    add_index :medicins, :name, unique: true
  end
end
