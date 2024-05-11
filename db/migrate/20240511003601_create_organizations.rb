class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :street
      t.string :street_number
      t.string :district
      t.string :city

      t.timestamps
    end
  end
end
