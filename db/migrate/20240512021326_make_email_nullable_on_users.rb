class MakeEmailNullableOnUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :email, true
    change_column_default :users, :email, nil
  end
end
