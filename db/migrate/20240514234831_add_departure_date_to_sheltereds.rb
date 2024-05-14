class AddDepartureDateToSheltereds < ActiveRecord::Migration[7.0]
  def change
    add_column :sheltereds, :departure_date, :date
  end
end
