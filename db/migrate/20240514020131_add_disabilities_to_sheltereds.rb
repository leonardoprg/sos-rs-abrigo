class AddDisabilitiesToSheltereds < ActiveRecord::Migration[7.0]
  def change
    add_column :sheltereds, :disabilities, :text
  end
end
