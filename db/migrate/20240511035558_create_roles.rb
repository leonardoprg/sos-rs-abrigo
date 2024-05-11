class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :name
      t.string :permissions, array: true

      t.timestamps
    end
  end
end
