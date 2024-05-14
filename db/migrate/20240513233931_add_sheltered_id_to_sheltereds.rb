class AddShelteredIdToSheltereds < ActiveRecord::Migration[7.0]
  def change
    add_reference :sheltereds, :sheltered, null: true, foreign_key: true
  end
end
