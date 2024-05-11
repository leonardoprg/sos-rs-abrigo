class CreateSheltereds < ActiveRecord::Migration[7.0]
  def change
    create_table :sheltereds do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :name, null: false
      t.string :document
      t.integer :children_in_house
      t.integer :adults_in_house
      t.integer :animals_in_house
      t.string :house_status
      t.date :birthdate
      t.string :street
      t.integer :street_integer
      t.string :district
      t.string :city
      t.string :gender
      t.text :special_needs
      t.text :medications
      t.boolean :government_assist
      t.boolean :cadunico

      t.timestamps
    end
  end
end
