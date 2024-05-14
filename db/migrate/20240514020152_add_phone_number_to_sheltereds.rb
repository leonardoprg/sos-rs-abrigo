class AddPhoneNumberToSheltereds < ActiveRecord::Migration[7.0]
  def change
    add_column :sheltereds, :phone_number, :string
  end
end
