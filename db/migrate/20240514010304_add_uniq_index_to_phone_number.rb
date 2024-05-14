class AddUniqIndexToPhoneNumber < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :phone_number, unique: true
  end
end
