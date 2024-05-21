class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :quantity, null: false, default: 0

      t.timestamps
    end
  end
end
